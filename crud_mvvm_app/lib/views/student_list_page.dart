import 'package:crud_mvvm_app/view_models/student_list_view_model.dart';
import 'package:crud_mvvm_app/views/student_insert_page.dart';
import 'package:crud_mvvm_app/widgets/student_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    // Provider를 호출해 접근
    // (listen: false일 경우 구독된 모든 위젯들에게 알림을 보내지 않게 한다; listen: true일 경우 알림 보냄)
    // final vm = Provider.of<StudentListViewModel>(context, listen: false);
    final vm = Provider.of<StudentListViewModel>(context);

    // StudentListViewModel (View Model) -> DBService (Service) -> Student (Model)
    vm.queryStudents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        backgroundColor: Color.fromARGB(255, 192, 133, 225),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const StudentInsert(); // student_insert_page.dart
              }));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StudentList(
              //**
              // student_list.dart (widget)
              // */
              students: vm.students,
              // final vm = Provider.of<StudentListViewModel>(context);
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red[50],
    );
  }
}
