import 'package:crud_mvvm_app/view_models/student_list_view_model.dart';
import 'package:crud_mvvm_app/views/student_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        // ChangeNotifierProvider를 통해 변화에 대해 구독 (하나만 구독 가능)
        create: (context) =>
            StudentListViewModel(), // student_list_view_model.dart
        child: const StudentListPage(), // student_list_page.dart
        // child 하위의 모든 것들은 StudentListViewModel에 접근 할 수 있다.
      ),
    );
  }
}
