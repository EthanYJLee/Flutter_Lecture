import 'package:collection_view_label_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 2021/12/21
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
