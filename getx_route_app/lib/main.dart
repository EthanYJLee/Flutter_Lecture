import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/home.dart';
import 'package:getx_route_app/third.dart';
import 'package:getx_route_app/trans.dart';

void main() {
  runApp(const MyApp());
}

// 2022-12-21
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX는 getmaterial을 사용한다.
    // import 'package:get/get.dart';
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      getPages: [
        GetPage(
          name: '/third',
          page: (() => const Third()),
        ),
      ],
    );
  }
}
