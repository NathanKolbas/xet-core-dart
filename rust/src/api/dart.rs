use std::{env, panic};
use flutter_rust_bridge::{frb, DartFnFuture};

#[frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

/// A wrapper for functions, callbacks, etc. needed from the dart side
#[frb(ignore)]
pub struct DartWrapper {
    pub dart_version: Box<dyn Fn() -> DartFnFuture<String> + Send + Sync>,
    pub hf_xet_version: Box<dyn Fn() -> DartFnFuture<String> + Send + Sync>,
    pub huggingface_hub_version: Box<dyn Fn() -> DartFnFuture<Option<String>> + Send + Sync>,
}

impl DartWrapper {
    pub fn new(
        dart_version: impl Fn() -> DartFnFuture<String> + Send + Sync + 'static,
        hf_xet_version: impl Fn() -> DartFnFuture<String> + Send + Sync + 'static,
        huggingface_hub_version: impl Fn() -> DartFnFuture<Option<String>> + Send + Sync + 'static,
    ) -> Self {
        Self {
            dart_version: Box::new(dart_version),
            hf_xet_version: Box::new(hf_xet_version),
            huggingface_hub_version: Box::new(huggingface_hub_version),
        }
    }
}

/// The Xet rust library uses environment variables in things like [default_config]. Since the goal
/// isn't to modify this library too much we will use this function to update the value of some
/// environment variables such as "HF_HOME". Otherwise, things will break for mobile platforms.
#[frb(ignore)]
pub fn set_env_var(key: String, value: Option<String>) -> Result<(), String> {
    if value.is_none() {
        return Ok(());
    }

    let result = panic::catch_unwind(|| {
        unsafe { env::set_var(key, value.unwrap()) }
    });

    match result {
        Ok(_) => { Ok(()) }
        Err(e) => { Err(format!("Error calling env::set_var: {:?}", e)) }
    }
}
