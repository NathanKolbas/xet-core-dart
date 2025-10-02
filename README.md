<h3 align="center">
  <p>🤗 hf-xet - xet client tech for dart, used in <a target="_blank" href="https://pub.dev/packages/huggingface_hub/">huggingface_hub</a></p>
</h3>

# hf_xet

> 📝
> This README was adapted from Huggingface's hf_xet README.

This library uses the awesome [flutter_rust_bridge](https://pub.dev/packages/flutter_rust_bridge) to make the dart <-> rust bindings easier.

Unfortunately, this library requires flutter. While flutter_rust_bridge does support pure dart, [the official toolchain](https://github.com/dart-lang/native/issues/883) for this has yet to be released. When this is done this library will be pure dart. You can find more information noted in [flutter_rust_bridge's documentation](https://cjycode.com/flutter_rust_bridge/guides/miscellaneous/pure-dart).

## Welcome

`hf-xet` enables `huggingface_hub` to utilize xet storage for uploading and downloading to HF Hub. Xet storage provides chunk-based deduplication, efficient storage/retrieval with local disk caching, and backwards compatibility with Git LFS. This library is not meant to be used directly, and is instead intended to be used from [huggingface_hub](https://pub.dev/packages/huggingface_hub).

## Key features

♻ **chunk-based deduplication implementation**: avoid transferring and storing chunks that are shared across binary files (models, datasets, etc).

🤗 **Dart bindings**: bindings for [huggingface_hub](https://pub.dev/packages/huggingface_hub/) package.

↔ **network communications**: concurrent communication to HF Hub Xet backend services (CAS).

🔖 **local disk caching**: chunk-based cache that sits alongside the existing [huggingface_hub disk cache](https://huggingface.co/docs/huggingface_hub/guides/manage-cache).

## Installation

Install the `hf_xet` package with [pub](https://pub.dev/packages/hf-xet/):

```bash
flutter pub install hf_xet
```

## Setup

To make sure everything is set up call `HfXet.ensureInitialized` from the initialization of your application. Here is an example for a flutter application:

```dart
import 'package:flutter/widgets.dart';
import 'package:hf_xet/hf_xet.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await HfXet.ensureInitialized();
  
  // Rest of your main function...
}
```

### MacOS

You may need the internet permission so that models can be downloaded. To do this add the following to both your `macos/Runner/DebugProfile.entitlements` and `macos/Runner/Release.entitlements`:

```xml
<key>com.apple.security.network.client</key>
<true/>
```

If you are looking for a concrete example checkout the `example/` directory.

TODO: This might be possible to put directly in the package so others don't have to do this

### iOS

You may need the internet permission so that models can be downloaded. To do this add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
   <key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

I did not have to do this but just in case you run into this issue you'll know how to fix it.

TODO: This might be possible to put directly in the package so others don't have to do this

## Quick Start

`hf_xet` is not intended to be run independently as it is expected to be used from `huggingface_hub`, so to get started with `huggingface_hub` check out the documentation [here]("https://hf.co/docs/huggingface_hub").

## Known Issues/Limits

Xet only works on 64-bit systems; 32-bit systems are [not supported](https://huggingface.co/docs/hub/en/storage-backends#current-limitations).

## Contributions (feature requests, bugs, etc.) are encouraged & appreciated 💙💚💛💜🧡❤️

Please join us in making hf-xet better. We value everyone's contributions. Code is not the only way to help. Answering questions, helping each other, improving documentation, filing issues all help immensely. If you are interested in contributing (please do!), check out the [contribution guide](https://github.com/NathanKolbas/xet-core-dart/blob/main/CONTRIBUTING.md) for this repository.
