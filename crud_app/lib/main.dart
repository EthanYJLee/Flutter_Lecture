import 'package:crud_app/update_student.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'select_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SelectAll(),
      getPages: [
        GetPage(
          name: '/read',
          page: (() => SelectAll()),
        ),
        GetPage(
          name: '/update',
          page: (() => UpdateStudent()),
        ),
      ],
      initialRoute: '/read',
    );
  }
}
