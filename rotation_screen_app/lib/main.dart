import 'package:flutter/material.dart';
import 'package:rotation_screen_app/home.dart';

void main() {
  runApp(const MyApp());
}

// 2022-12-21
// 세로, 가로모드 모두 사용하기 위해 위젯만 따로 관리하는 class를 만들어준다.
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
