import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class InsertStudent extends StatefulWidget {
  const InsertStudent({super.key});

  @override
  State<InsertStudent> createState() => _InsertStudentState();
}

class _InsertStudentState extends State<InsertStudent> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  late String code = '';
  late String name = '';
  late String dept = '';
  late String phone = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
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
                    const InputDecoration(labelText: '학번을 입력하세요 (최대 4문자/숫자)'),
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

                  getJSONData();
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
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    await http.get(url);
    _showDialog(context);
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
