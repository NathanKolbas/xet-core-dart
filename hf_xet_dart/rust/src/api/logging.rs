use std::env;
use std::path::Path;
use std::sync::OnceLock;
use flutter_rust_bridge::frb;
use tracing::info;
use tracing_subscriber::layer::SubscriberExt;
use tracing_subscriber::util::SubscriberInitExt;
use tracing_subscriber::{EnvFilter, Layer};
use utils::normalized_path_from_user_string;
use crate::api::dart::DartWrapper;

/// Default log level for the library to use. Override using `RUST_LOG` env variable.
#[cfg(not(debug_assertions))]
const DEFAULT_LOG_LEVEL: &str = "warn";

#[cfg(debug_assertions)]
const DEFAULT_LOG_LEVEL: &str = "warn";

fn use_json() -> Option<bool> {
    env::var("HF_XET_LOG_FORMAT").ok().map(|s| s.eq_ignore_ascii_case("json"))
}

fn init_logging_to_file(path: &Path) -> Result<(), std::io::Error> {
    // Set up logging to a file.
    use std::ffi::OsStr;

    use tracing_appender::{non_blocking, rolling};

    let (path, file_name) = match path.file_name() {
        Some(name) => (path.to_path_buf(), name),
        None => (path.join("xet.log"), OsStr::new("xet.log")),
    };

    let log_directory = match path.parent() {
        Some(parent) => {
            std::fs::create_dir_all(parent)?;
            parent
        },
        None => Path::new("."),
    };

    // Make sure the log location is writeable so we error early here and dump to stderr on failure.
    std::fs::write(&path, [])?;

    // Build a non‑blocking file appender. • `rolling::never` = one static file, no rotation. • Keep the
    // `WorkerGuard` alive so the background thread doesn’t shut down and drop messages.
    let file_appender = rolling::never(log_directory, file_name);

    let (writer, guard) = non_blocking(file_appender);

    // Store the guard globally so it isn’t dropped.
    static FILE_GUARD: OnceLock<tracing_appender::non_blocking::WorkerGuard> = OnceLock::new();
    let _ = FILE_GUARD.set(guard); // ignore error if already initialised

    let registry = tracing_subscriber::registry();
    #[cfg(feature = "tokio-console")]
    let registry = {
        // Console subscriber layer for tokio-console, custom filter for tokio trace level events
        let console_layer = console_subscriber::spawn().with_filter(EnvFilter::new("tokio=trace,runtime=trace"));
        registry.with(console_layer)
    };

    // Build the fmt layer.
    let fmt_layer_base = tracing_subscriber::fmt::layer()
        .with_line_number(true)
        .with_file(true)
        .with_target(false)
        .with_writer(writer);
    // Standard filter layer: RUST_LOG env var or DEFAULT_LOG_LEVEL fallback.
    let fmt_filter = EnvFilter::try_from_default_env()
        .or_else(|_| EnvFilter::try_new(DEFAULT_LOG_LEVEL))
        .unwrap_or_default();

    if use_json().unwrap_or(true) {
        registry.with(fmt_layer_base.json().with_filter(fmt_filter)).init();
    } else {
        registry.with(fmt_layer_base.pretty().with_filter(fmt_filter)).init();
    };

    Ok(())
}

async fn get_version_info_string(dw: DartWrapper) -> String {
    // populate remote telemetry calls with versions for dart and hf_hub if possible
    let mut version_info = String::new();

    // Get Dart version
    let dart_version_number = (dw.dart_version)().await;
    version_info.push_str(&format!("dart/{dart_version_number}; "));

    // Get huggingface_hub+hf_xet versions
    let hf_xet_version = (dw.hf_xet_version)().await;
    version_info.push_str(&format!("hfxet/{hf_xet_version}; "));

    (dw.huggingface_hub_version)().await.map(|huggingface_hub_version| {
        version_info.push_str(&format!("huggingface_hub/{huggingface_hub_version}; "));
    });

    version_info
}

#[frb(ignore)]
pub async fn init_logging(dw: DartWrapper) {
    let version_info = get_version_info_string(dw).await;

    if let Ok(log_path_s) = env::var("HF_XET_LOG_FILE") {
        let log_path = normalized_path_from_user_string(log_path_s);
        match init_logging_to_file(&log_path) {
            Ok(_) => {
                info!("hf_xet version info: {version_info}");
                return;
            },
            Err(e) => {
                eprintln!("Error opening log file {log_path:?} for writing: {e:?}.  Reverting to logging to console.");
            },
        }
    }

    // Now, just use basic console logging.
    let registry = tracing_subscriber::registry();
    #[cfg(feature = "tokio-console")]
    let registry = {
        // Console subscriber layer for tokio-console, custom filter for tokio trace level events
        let console_layer = console_subscriber::spawn().with_filter(EnvFilter::new("tokio=trace,runtime=trace"));
        registry.with(console_layer)
    };

    let fmt_layer_base = tracing_subscriber::fmt::layer()
        .with_line_number(true)
        .with_file(true)
        .with_target(false);
    let fmt_filter = EnvFilter::try_from_default_env()
        .or_else(|_| EnvFilter::try_new(DEFAULT_LOG_LEVEL))
        .unwrap_or_default();

    if use_json().unwrap_or(false) {
        let filtered_fmt_layer = fmt_layer_base.json().with_filter(fmt_filter);
        registry.with(filtered_fmt_layer).init();
    } else {
        let filtered_fmt_layer = fmt_layer_base.pretty().with_filter(fmt_filter);
        registry.with(filtered_fmt_layer).init();
    }

    info!("hf_xet version info: {version_info}");
}
