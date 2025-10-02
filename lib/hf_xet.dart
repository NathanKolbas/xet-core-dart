library;

export 'src/rust/api/token_refresh.dart';
export 'src/rust/api/progress_update.dart';
export 'src/rust/api.dart' show DartXetDownloadInfo, DartXetUploadInfo;

import 'dart:async' show FutureOr;
import 'dart:typed_data' show Uint8List;

import 'src/rust/api.dart' as api;
import 'src/rust/api/progress_update.dart';
import 'src/rust/api/token_refresh.dart';
import 'src/rust/frb_generated.dart' show RustLib;

// Some of the types cannot be made optional (passed dart functions to rust) so
// we handle it on the dart side

DartTokenInfo _tokenRefresher() => DartTokenInfo(
  token: '',
  expiration: BigInt.zero,
);

void _progressUpdater(
  DartTotalProgressUpdate _,
  List<DartItemProgressUpdate> _,
) {}

void _progressUpdaterWithFileName(
  String _,
  DartTotalProgressUpdate _,
  List<DartItemProgressUpdate> _,
) {}

Future<List<api.DartXetUploadInfo>> uploadBytes({
  required List<Uint8List> fileContents,
  String? endpoint,
  (String token, BigInt expiration)? tokenInfo,
  FutureOr<DartTokenInfo> Function()? tokenRefresher,
  FutureOr<void> Function(
    DartTotalProgressUpdate totalUpdate,
    List<DartItemProgressUpdate> itemUpdates,
  )? progressUpdater,
  String? repoType,
}) => api.uploadBytes(
  fileContents: fileContents,
  endpoint: endpoint,
  hfHome: HfXet.getHuggingfaceHome?.call(),
  tokenInfo: tokenInfo,
  tokenRefresher: tokenRefresher ?? _tokenRefresher,
  progressUpdater: progressUpdater ?? _progressUpdater,
  repoType: repoType,
);

Future<List<api.DartXetUploadInfo>> uploadFiles({
  required List<String> filePaths,
  String? endpoint,
  (String token, BigInt expiration)? tokenInfo,
  FutureOr<DartTokenInfo> Function()? tokenRefresher,
  FutureOr<void> Function(
    DartTotalProgressUpdate totalUpdate,
    List<DartItemProgressUpdate> itemUpdates,
  )? progressUpdater,
  String? repoType,
}) => api.uploadFiles(
  filePaths: filePaths,
  endpoint: endpoint,
  hfHome: HfXet.getHuggingfaceHome?.call(),
  tokenInfo: tokenInfo,
  tokenRefresher: tokenRefresher ?? _tokenRefresher,
  progressUpdater: progressUpdater ?? _progressUpdater,
  repoType: repoType,
);

Future<List<String>> downloadFiles({
  required List<api.DartXetDownloadInfo> files,
  String? endpoint,
  (String token, BigInt expiration)? tokenInfo,
  FutureOr<DartTokenInfo> Function()? tokenRefresher,
  /// A callback function informing the progress of file downloads.
  /// [fileName] - indicates the progress of a certain file.
  /// [progress] - the number of bytes downloaded since the last update. The sum
  /// of all the progress callbacks should equal to the size of the [fileName].
  FutureOr<void> Function(
    String fileName,
    DartTotalProgressUpdate totalUpdate,
    List<DartItemProgressUpdate> itemUpdates,
  )? progressUpdater,
}) => api.downloadFiles(
  files: files,
  endpoint: endpoint,
  hfHome: HfXet.getHuggingfaceHome?.call(),
  tokenInfo: tokenInfo,
  tokenRefresher: tokenRefresher ?? _tokenRefresher,
  progressUpdater: progressUpdater ?? _progressUpdaterWithFileName,
);

class HfXet {
  static final HfXet _instance = HfXet._internal();

  factory HfXet() => _instance;

  HfXet._internal();

  bool _initialized = false;

  /// If hf_xet is initialized. Typically you don't need this and can just call
  /// [ensureInitialized] directly without checking if initialized prior.
  static bool get initialized => HfXet._instance._initialized;

  bool _supported = false;

  String? _huggingfaceHubVersion;

  /// Set this value if running in `hugginface_hub`.
  set huggingfaceHubVersion(String? value) => _huggingfaceHubVersion = value;

  /// If hf_xet is supported in the current environment. If [ensureInitialized]
  /// is not called first this will be false.
  static bool isSupported() => HfXet._instance._supported;

  static String _dartVersion() => '';

  // TODO: This needs to be automated to put the version number below
  static String _hfXetVersion() => '0.0.1';

  static String? _getHuggingfaceHubVersion() => HfXet._instance._huggingfaceHubVersion;

  /// Gets the HF_HOME dir. Can be set during [ensureInitialized].
  static String Function()? getHuggingfaceHome;

  /// Make sure hf_xet is initialized.
  ///
  /// If [throwOnFail] is set to true then an exception will be thrown if
  /// initialization fails. By default this is false so that you can check if
  /// hf_xet is supported in the current environment.
  ///
  /// Returns [bool] whether or not initialization was successful. If
  /// [throwOnFail] is true then you must catch the error.
  static Future<bool> ensureInitialized({
    bool throwOnFail = false,
    String? huggingfaceHubVersion,
    String Function()? huggingfaceHome,
  }) async {
    if (HfXet._instance._initialized) return true;

    HfXet._instance._huggingfaceHubVersion = huggingfaceHubVersion;

    try {
      await RustLib.init();
      await api.hfXet(
        dartVersion: _dartVersion,
        hfXetVersion: _hfXetVersion,
        huggingfaceHubVersion: _getHuggingfaceHubVersion,
      );

      HfXet._instance._initialized = true;
      HfXet._instance._supported = true;
      HfXet.getHuggingfaceHome = huggingfaceHome;

      return HfXet._instance._initialized;
    } catch (_) {
      if (throwOnFail) {
        rethrow;
      }
    }

    return HfXet._instance._initialized;
  }
}
