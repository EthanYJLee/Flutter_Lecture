import 'package:flutter/material.dart';
import 'package:shared_preferences_login_app/login.dart';

void main() {
  runApp(const MyApp());
}

// 2022-12-23
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
      home: const Login(),
    );
  }
}
