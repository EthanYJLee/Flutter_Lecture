import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/home.dart';

import 'model/students.dart';

class InsertStudent extends StatefulWidget {
  const InsertStudent({super.key});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  late DatabaseHandler handler = DatabaseHandler();
  late TextEditingController codeController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController deptController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late String code = '';
  late String name = '';
  late String dept = '';
  late String phone = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController.text = 'S';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Students')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration:
                    const InputDecoration(labelText: '학번을 입력하세요 (3자리 숫자)'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '이름을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text;

                  addStudents();
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Home();
                  })));
                },
                child: Text(
                  '입력',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  Future<int> addStudents() async {
    Students student =
        Students(code: '$code', name: '$name', dept: '$dept', phone: '$phone');
    await handler.insertStudents(student);
    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('입력 결과'),
            content: Text('입력이 완료되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text(
                  '완료',
                ),
              ),
            ],
          );
        });
  }
}
