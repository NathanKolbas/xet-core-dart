import 'package:flutter/material.dart';
import 'package:hf_xet/hf_xet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HfXet.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text('Hi :)'),
        ),
      ),
    );
  }
}
