import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mvvm_pattern_sample/mvvm/view/mvvm_view.dart';
import 'package:mvvm_pattern_sample/normal/pattern_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: PatternHome(),
    );
  }
}
