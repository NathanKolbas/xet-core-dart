import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hf_xet/hf_xet.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await HfXet.ensureInitialized(throwOnFail: true));

  group('downloadFiles', () {
    // This test fails and that's fine, we just want to make sure we can use the
    // rust library from dart. To check integration look at `huggingface_hub`.
    test('can download google-bert/bert-base-uncased', () async {
      final f = await downloadFiles(
        files: [
          DartXetDownloadInfo(
            destinationPath: '',
            hash: 'ea201fabe466ef7182f1f687fb5be4b62a73d3a78883f11264ff7f682cdb54bf',
            fileSize: BigInt.from(438_064_459),
          ),
        ],
        endpoint: 'https://huggingface.co',
        tokenRefresher: () => DartTokenInfo(
          token: '',
          expiration: BigInt.from(DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch),
        ),
        progressUpdater: (file, progress) => print('file: $file, progress: $progress'),
      );
      print(f);
    });
  });
}
