use std::sync::Arc;
use flutter_rust_bridge::{frb, DartFnFuture};
use error_printer::ErrorPrinter;
use progress_tracking::{ProgressUpdate, TrackingProgressUpdater};
use xet_runtime::exports::tokio;

use crate::api::runtime::convert_multithreading_error;

/// Dart-exposed versions of the per-item and total progress update classes.
///
/// Both `DartTotalProgressUpdate` and `DartItemProgressUpdate` are passed
/// into a Dart callback given to the wrapper class below.  For example (in python):
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
#[frb(json_serializable)]
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
#[frb(json_serializable)]
pub struct DartTotalProgressUpdate {
    /// The total bytes known for processing and possibly uploaded or downloaded.
    pub total_bytes: u64,

    /// How much total_bytes has changed from the last update.
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
    dart_func: Option<Box<dyn Fn(
        DartTotalProgressUpdate,
        Vec<DartItemProgressUpdate>,
    ) -> DartFnFuture<()> + Send + Sync>>,
}

impl WrappedProgressUpdaterImpl {
    pub fn new(
        dart_func: Option<impl Fn(
            DartTotalProgressUpdate,
            Vec<DartItemProgressUpdate>,
        ) -> DartFnFuture<()> + Send + Sync + 'static>
    ) -> Result<Self, String> {
        // It is simpler with dart if we only have one function type. We will always use the
        // detailed progress update.

        match dart_func {
            // Test if it's enabled first; if None is passed in, then this is disabled
            None => Ok(Self {
                progress_updating_enabled: false,
                dart_func: None,
            }),
            Some(f) => {
                Ok(Self {
                    progress_updating_enabled: true,
                    dart_func: Some(Box::new(f)),
                })
            }
        }
    }

    async fn register_updates_impl(self: Arc<Self>, updates: ProgressUpdate) -> Result<(), String> {
        // Spawn a new async task to handle the progress update without blocking the caller.
        tokio::spawn(async move {
            let f = self.dart_func
                .as_ref()
                .ok_or_else(|| "Progress callback function is not set".to_string())?;

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

            f(total_update_report, item_updates).await;

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
    pub fn new(
        dart_func: Option<impl Fn(
            DartTotalProgressUpdate,
            Vec<DartItemProgressUpdate>,
        ) -> DartFnFuture<()> + Send + Sync + 'static>
    ) -> Result<Self, String> {
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
