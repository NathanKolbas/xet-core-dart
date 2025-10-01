pub(crate) mod logging;
pub(crate) mod dart;
pub(crate) mod progress_update;
pub(crate) mod runtime;
pub(crate) mod token_refresh;

use std::fmt::Debug;
use std::iter::IntoIterator;
use std::sync::Arc;
use flutter_rust_bridge::{frb, DartFnFuture};
pub use data::errors::DataProcessingError;
pub use data::{XetFileInfo, data_client};
use itertools::Itertools;
pub use progress_tracking::TrackingProgressUpdater;
use rand::Rng;
use runtime::async_run;
use token_refresh::WrappedTokenRefresher;
use tracing::debug;
pub use utils::auth::TokenRefresher;
use xet_runtime::file_handle_limits;
use crate::api::dart::{set_env_var, DartWrapper};
use crate::api::logging::init_logging;
use crate::api::progress_update::WrappedProgressUpdater;
use crate::api::token_refresh::DartTokenInfo;

// For profiling
#[cfg(feature = "profiling")]
pub(crate) mod profiling;

fn convert_data_processing_error(e: DataProcessingError) -> String {
    if cfg!(debug_assertions) {
        format!("Data processing error: {e:?}")
    } else {
        format!("Data processing error: {e}")
    }
}

pub fn upload_bytes(
    file_contents: Vec<Vec<u8>>,
    endpoint: Option<String>,
    hf_home: Option<String>,
    token_info: Option<(String, u64)>,
    // frb doesn't yet support passing function wrapped by an Option. Handled on the dart side.
    token_refresher: impl Fn() -> DartFnFuture<DartTokenInfo> + Send + Sync + 'static,
    // frb doesn't yet support passing function wrapped by an Option. Handled on the dart side.
    progress_updater: impl Fn(u64) -> DartFnFuture<()> + Send + Sync + 'static,
    _repo_type: Option<String>,
) -> Result<Vec<DartXetUploadInfo>, String> {
    set_env_var("HF_HOME".to_string(), hf_home)?;

    let refresher = Arc::new(WrappedTokenRefresher::from_func(token_refresher));
    let updater = Arc::new(WrappedProgressUpdater::new(Option::from(progress_updater))?);
    let x: u64 = rand::rng().random();

    async_run(async move {
        debug!(
      "Upload bytes call {x:x}: (PID = {}) Uploading {} files as bytes.",
      std::process::id(),
      file_contents.len(),
    );

        let out: Vec<DartXetUploadInfo> = data_client::upload_bytes_async(
            file_contents,
            endpoint,
            token_info,
            Option::from(refresher as Arc<_>),
            Option::from(updater as Arc<_>),
        )
            .await
            .map_err(convert_data_processing_error)?
            .into_iter()
            .map(DartXetUploadInfo::from)
            .collect();

        debug!("Upload bytes call {x:x} finished.");

        Ok(out)
    })
}

pub fn upload_files(
    file_paths: Vec<String>,
    endpoint: Option<String>,
    hf_home: Option<String>,
    token_info: Option<(String, u64)>,
    // frb doesn't yet support passing function wrapped by an Option. Handled on the dart side.
    token_refresher: impl Fn() -> DartFnFuture<DartTokenInfo> + Send + Sync + 'static,
    // frb doesn't yet support passing function wrapped by an Option. Handled on the dart side.
    progress_updater: impl Fn(u64) -> DartFnFuture<()> + Send + Sync + 'static,
    _repo_type: Option<String>,
) -> Result<Vec<DartXetUploadInfo>, String> {
    set_env_var("HF_HOME".to_string(), hf_home)?;

    let refresher = Arc::new(WrappedTokenRefresher::from_func(token_refresher));
    let updater = Arc::new(WrappedProgressUpdater::new(Option::from(progress_updater))?);

    let file_names = file_paths.iter().take(3).join(", ");

    let x: u64 = rand::rng().random();

    async_run(async move {
        debug!(
      "Upload call {x:x}: (PID = {}) Uploading {} files {file_names}{}",
      std::process::id(),
      file_paths.len(),
      if file_paths.len() > 3 { "..." } else { "." }
    );

        let out: Vec<DartXetUploadInfo> = data_client::upload_async(
            file_paths,
            endpoint,
            token_info,
            Option::from(refresher as Arc<_>),
            Option::from(updater as Arc<_>),
        )
            .await
            .map_err(convert_data_processing_error)?
            .into_iter()
            .map(DartXetUploadInfo::from)
            .collect();

        debug!("Upload call {x:x} finished.");

        Ok(out)
    })
}

pub fn download_files(
    files: Vec<DartXetDownloadInfo>,
    endpoint: Option<String>,
    hf_home: Option<String>,
    token_info: Option<(String, u64)>,
    // frb doesn't yet support passing function wrapped by an Option. Handled on the dart side.
    token_refresher: impl Fn() -> DartFnFuture<DartTokenInfo> + Send + Sync + 'static,
    // frb doesn't yet support passing functions wrapped by an Option<Vec<>>. Handled on the dart side.
    progress_updater: impl Fn(String, u64) -> DartFnFuture<()> + Send + Sync + 'static,
) -> Result<Vec<String>, String> {
    set_env_var("HF_HOME".to_string(), hf_home)?;

    let file_infos: Vec<_> = files.clone().into_iter().map(<(XetFileInfo, DestinationPath)>::from).collect();
    let refresher = Arc::new(WrappedTokenRefresher::from_func(token_refresher));
    let updaters = try_parse_progress_updaters(files.clone(), Arc::new(progress_updater))?;

    let x: u64 = rand::rng().random();

    let file_names = file_infos.iter().take(3).map(|(_, p)| p).join(", ");

    async_run(async move {
        debug!(
            "Download call {x:x}: (PID = {}) Downloading {} files {file_names}{}",
            std::process::id(),
            file_infos.len(),
            if file_infos.len() > 3 { "..." } else { "." }
        );

        let out: Vec<String> =
            data_client::download_async(file_infos, endpoint, token_info, Some(refresher), Some(updaters))
                .await
                .map_err(convert_data_processing_error)?;

        debug!("Download call {x:x}: Completed.");

        Ok(out)
    })
}

#[frb(ignore)]
pub fn force_sigint_shutdown() -> Result<(), String> {
    // Force a signint shutdown in the case where it gets intercepted by another process.
    crate::api::runtime::perform_sigint_shutdown();
    Err("KeyboardInterrupt".to_string())
}

fn try_parse_progress_updaters(
    files: Vec<DartXetDownloadInfo>,
    progress_updater: Arc<dyn Fn(String, u64) -> DartFnFuture<()> + Send + Sync + 'static>,
) -> Result<Vec<Arc<dyn TrackingProgressUpdater>>, String> {
    // Since we can't yet pass a Vec of callbacks we will use progress_updater to send back the file
    // path and the progress.
    let mut updaters = Vec::with_capacity(files.len());
    for file in files {
        let progress_updater_ref = Arc::clone(&progress_updater);
        let callback_wrapped = Option::from(move |p: u64| progress_updater_ref(file.destination_path.clone(), p));
        let wrapped = Arc::new(WrappedProgressUpdater::new(callback_wrapped)?);
        updaters.push(wrapped as Arc<dyn TrackingProgressUpdater>);
    }
    Ok(updaters)
}

// TODO: we won't need to subclass this in the next major version update.
#[derive(Clone, Debug)]
pub struct DartXetDownloadInfo {
    pub destination_path: String,
    pub hash: String,
    pub file_size: u64,
}

impl DartXetDownloadInfo {
    pub fn new(destination_path: String, hash: String, file_size: u64) -> Self {
        Self {
            destination_path,
            hash,
            file_size,
        }
    }

    fn __str__(&self) -> String {
        format!("{self:?}")
    }

    fn __repr__(&self) -> String {
        format!("DartXetDownloadInfo({}, {}, {})", self.destination_path, self.hash, self.file_size)
    }
}

#[derive(Clone, Debug)]
pub struct DartXetUploadInfo {
    pub hash: String,
    pub file_size: u64,
}

impl DartXetUploadInfo {
    pub fn new(hash: String, file_size: u64) -> Self {
        Self { hash, file_size }
    }

    fn __str__(&self) -> String {
        format!("{self:?}")
    }

    fn __repr__(&self) -> String {
        format!("DartXetUploadInfo({}, {})", self.hash, self.file_size)
    }
}

type DestinationPath = String;

impl From<XetFileInfo> for DartXetUploadInfo {
    fn from(xf: XetFileInfo) -> Self {
        Self {
            hash: xf.hash().to_owned(),
            file_size: xf.file_size(),
        }
    }
}

impl From<DartXetDownloadInfo> for (XetFileInfo, DestinationPath) {
    fn from(pf: DartXetDownloadInfo) -> Self {
        (XetFileInfo::new(pf.hash, pf.file_size), pf.destination_path)
    }
}

pub async fn hf_xet(
    dart_version: impl Fn() -> DartFnFuture<String> + Send + Sync + 'static,
    hf_xet_version: impl Fn() -> DartFnFuture<String> + Send + Sync + 'static,
    huggingface_hub_version: impl Fn() -> DartFnFuture<Option<String>> + Send + Sync + 'static,
) -> Result<(), String> {
    let dw: DartWrapper = DartWrapper {
        dart_version: Box::new(dart_version),
        hf_xet_version: Box::new(hf_xet_version),
        huggingface_hub_version: Box::new(huggingface_hub_version),
    };

    // Make sure the logger is set up.
    // We don't want to set it up on Android, iOS, or WASM since that is handled by
    // flutter_Rust_bridge and will cause a crash due to two loggers initialized.
    #[cfg(not(any(target_os = "android", target_os = "ios", target_os = "macos", target_family = "wasm")))]
    init_logging(dw).await;

    // Raise the soft file handle limits if possible
    file_handle_limits::raise_nofile_soft_to_hard();

    Ok(())
}
