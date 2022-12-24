import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/home.dart';

import 'model/students.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  late DatabaseHandler handler = DatabaseHandler();
  late TextEditingController codeController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController deptController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late String code = '';
  late String name = '';
  late String dept = '';
  late String phone = '';
  late Map students = Students.fromMap({}).toMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController.text = students['code'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: codeController,
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text(
                    '학번 (수정 불가)',
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text(
                    '이름을 수정하세요',
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  label: Text(
                    '전공을 수정하세요',
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text(
                    '전화번호를 수정하세요',
                  ),
                ),
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
                  updateStudent();
                  _showDialog(context);
                },
                child: const Text(
                  '수정하기',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> updateStudent() async {
    Students student =
        Students(code: '$code', name: '$name', dept: '$dept', phone: '$phone');
    await handler.updateStudent(student);
    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('수정 결과'),
            content: Text('수정이 완료되었습니다'),
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
