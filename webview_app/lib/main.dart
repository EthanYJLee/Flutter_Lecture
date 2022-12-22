import 'package:flutter/material.dart';
import 'package:webview_app/home.dart';

void main() {
  runApp(const MyApp());
}

// 2022-12-22
// flutter webview 3.0.4 version
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
