import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
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
    codeController.text = Get.parameters['code'] ?? '_';
    nameController.text = Get.parameters['name'] ?? '_';
    deptController.text = Get.parameters['dept'] ?? '_';
    phoneController.text = Get.parameters['phone'] ?? '_';
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
                  getJSONData();
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

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_update_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    await http.get(url);
    _showDialog(context);
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
