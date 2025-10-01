use std::fmt::{Debug, Formatter};
use std::sync::Arc;
use flutter_rust_bridge::{frb, DartFnFuture};
use error_printer::ErrorPrinter;
use itertools::Itertools;
use progress_tracking::{ProgressUpdate, TrackingProgressUpdater};
use tracing::error;
use utils::auth::TokenInfo;
use xet_runtime::exports::tokio;

use crate::api::runtime::convert_multithreading_error;

/// Python-exposed versions of the per-item and total progress update classes.
///
/// Both `PyTotalProgressUpdate` and `PyItemProgressUpdate` are passed
/// into a Python callback given to the wrapper class below.  For example:
///
/// ```python
/// def update_progress(self, total_update, item_updates):
///     from rich.progress import Progress, TextColumn, BarColumn, TimeRemainingColumn
///
///     # Update overall progress (we assume this has been initialized).
///     self.progress.update(
///         self.bytes_processed_task_id,
///         advance=total_update.total_bytes_completion_increment,
///         total = total_update.total_bytes
///     )
///
///     # Update upload progress ; the total may have changed so set that too.
///     self.progress.update(
///         self.bytes_uploaded_task_id,
///         advance=total_update.total_transfer_bytes_completion_increment,
///         total = total_update.total_transfer_bytes
///     )
///
///     # Update each item:
///     for item in item_updates:
///         name = item.item_name
///         if name not in self.item_tasks:
///             self.item_tasks[name] = self.progress.add_task(
///                 name, total=item.total_bytes
///             )
///         self.progress.update(
///             self.item_tasks[name],
///             advance=item.bytes_completion_increment,
///         )
/// ```
///
/// In addition, the other possible bookkeeping values for everything are contained in this
/// as needed.
pub struct DartItemProgressUpdate {
    /// The name of the item, or a tag that is translated later.
    pub item_name: String,

    /// The total bytes contained in this item.   
    pub total_bytes: u64,

    /// The number of bytes completed so far, either by deduplication or transfer.
    pub bytes_completed: u64,

    /// The change in bytes completed since the last update.
    pub bytes_completion_increment: u64,
}

/// Update class for total updates
pub struct DartTotalProgressUpdate {
    /// The total bytes known for processing and possibly uploaded or downloaded.
    pub total_bytes: u64,

    /// How much total_bytes has changed from the last update..
    pub total_bytes_increment: u64,

    /// How many of the bytes queued for processing have been examined
    /// and either deduped or queued for upload or download.  
    pub total_bytes_completed: u64,

    /// The change in total_bytes_completed since the same upload.  
    pub total_bytes_completion_increment: u64,

    /// If known, the current completion speed.
    pub total_bytes_completion_rate: Option<f64>,

    /// The total bytes scheduled for transfer; also contained in total_bytes.
    pub total_transfer_bytes: u64,

    /// How much total_transfer_bytes has changed since the last update.
    pub total_transfer_bytes_increment: u64,

    /// The cumulative bytes uploaded or downloaded so far.  Also contained in total_bytes_completed.
    pub total_transfer_bytes_completed: u64,

    /// The change in total_transfer_bytes_completed since the last update.
    pub total_transfer_bytes_completion_increment: u64,

    /// If known, the current completion speed for bytes transferred.
    pub total_transfer_bytes_completion_rate: Option<f64>,
}

/// A wrapper over a passed-in python function to update
/// the python process of some download/upload progress
/// implements the ProgressUpdater trait and should be
/// passed around as a ProgressUpdater trait object or
/// as a template parameter
#[frb(ignore)]
struct WrappedProgressUpdaterImpl {
    /// Is this enabled?
    progress_updating_enabled: bool,

    /// the function py_func is responsible for passing in the update value
    /// into the python context. Expects 1 int (uint64) parameter that
    /// is a number to increment the progress counter by.
    dart_func: Option<Box<dyn Fn(u64) -> DartFnFuture<()> + Send + Sync>>,

    /// Whether to use the simple incremental progress updating method or
    /// the more detailed
    update_with_detailed_progress: bool,
}

const DETAILED_PROGRESS_ARG_NAMES: [&str; 2] = ["total_update", "item_updates"];

impl WrappedProgressUpdaterImpl {
    pub fn new(dart_func: Option<impl Fn(u64) -> DartFnFuture<()> + Send + Sync + 'static>) -> Result<Self, String> {
        // Analyze the function to make sure it's the correct form. If it's 4 arguments with
        // the appropriate names, then we call it using the detailed progress update; if it's
        // a single function, we assume it's a global increment function and just pass in the update
        // increment.

        match dart_func {
            // Test if it's enabled first; if None is passed in, then this is disabled
            None => Ok(Self {
                progress_updating_enabled: false,
                dart_func: None,
                update_with_detailed_progress: false,
            }),
            Some(f) => {
                let update_with_detailed_progress = false;
                // let update_with_detailed_progress = match param_names.len() {
                //     1 => false,
                //     2 => {
                //         if param_names
                //           .iter()
                //           .zip(DETAILED_PROGRESS_ARG_NAMES.into_iter())
                //           .all(|(v1, v2)| v1.to_string_lossy(py) == v2)
                //         {
                //             true
                //         } else {
                //             return Err(PyTypeError::new_err(format!(
                //                 "Function {name} must have either one argument or two named arguments ({})",
                //                 DETAILED_PROGRESS_ARG_NAMES.iter().join(", ")
                //             )));
                //         }
                //     },
                // };

                Ok(Self {
                    progress_updating_enabled: true,
                    dart_func: Some(Box::new(f)),
                    update_with_detailed_progress,
                })
            }
        }
    }

    async fn register_updates_impl(self: Arc<Self>, updates: ProgressUpdate) -> Result<(), String> {
        // Spawn a new async task to handle the progress update without blocking the caller.
        tokio::spawn(async move {
            let f = self.dart_func.as_ref().ok_or_else(|| "Progress callback function is not set".to_string())?;

            if self.update_with_detailed_progress {
                let total_update_report = DartTotalProgressUpdate {
                    total_bytes: updates.total_bytes,
                    total_bytes_increment: updates.total_bytes_increment,
                    total_bytes_completed: updates.total_bytes_completed,
                    total_bytes_completion_increment: updates.total_bytes_completion_increment,
                    total_bytes_completion_rate: updates.total_bytes_completion_rate,
                    total_transfer_bytes: updates.total_transfer_bytes,
                    total_transfer_bytes_increment: updates.total_transfer_bytes_increment,
                    total_transfer_bytes_completed: updates.total_transfer_bytes_completed,
                    total_transfer_bytes_completion_increment: updates
                      .total_transfer_bytes_completion_increment,
                    total_transfer_bytes_completion_rate: updates.total_transfer_bytes_completion_rate,
                };

                let item_updates: Vec<DartItemProgressUpdate> = updates
                  .item_updates
                  .into_iter()
                  .map(|u| {
                      DartItemProgressUpdate {
                          item_name: u.item_name.to_string(),
                          total_bytes: u.total_bytes,
                          bytes_completed: u.bytes_completed,
                          bytes_completion_increment: u.bytes_completion_increment,
                      }
                  })
                  .collect::<Vec<DartItemProgressUpdate>>();

                // f();
            } else {
                let update_increment: u64 = updates.item_updates
                  .iter()
                  .map(|pr| pr.bytes_completion_increment)
                  .sum();

                if update_increment > 0 {
                    f(update_increment).await;
                }
            }

            Ok(())
        })
        .await
        .map_err(convert_multithreading_error)?
    }
}

#[frb(ignore)]
pub struct WrappedProgressUpdater {
    inner: Arc<WrappedProgressUpdaterImpl>,
}

impl WrappedProgressUpdater {
    pub fn new(dart_func: Option<impl Fn(u64) -> DartFnFuture<()> + Send + Sync + 'static>) -> Result<Self, String> {
        Ok(Self {
            inner: Arc::new(WrappedProgressUpdaterImpl::new(dart_func)?),
        })
    }
}

#[async_trait::async_trait]
impl TrackingProgressUpdater for WrappedProgressUpdater {
    async fn register_updates(&self, updates: ProgressUpdate) {
        let inner = self.inner.clone();

        if inner.progress_updating_enabled && inner.dart_func.is_some() {
            let _ = inner
                .register_updates_impl(updates)
                .await
                .log_error("Dart exception updating progress:");
        }
    }
}
