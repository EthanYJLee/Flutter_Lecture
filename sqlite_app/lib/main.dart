import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/home.dart';
import 'package:sqlite_app/insert_student.dart';
import 'package:sqlite_app/update_students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      getPages: [
        GetPage(
          name: '/',
          page: (() => const Home()),
        ),
        GetPage(
          name: '/insert',
          page: (() => const InsertStudent()),
        ),
        GetPage(
          name: '/update',
          page: (() => const UpdateStudent()),
        ),
      ],
      initialRoute: '/',
    );
  }
}
