import 'dart:convert';

import 'package:crud_app/insert_student.dart';
import 'package:crud_app/main.dart';
import 'package:crud_app/update_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SelectAll extends StatefulWidget {
  const SelectAll({super.key});

  @override
  State<SelectAll> createState() => _SelectAllState();
}

class _SelectAllState extends State<SelectAll> {
  late List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const InsertStudent();
                  }),
                ),
              ).then((value) => getJsonData());
            }),
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                      key: Key(
                        index.toString(),
                      ),
                      background: Container(
                        color: Colors.white,
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Delete',
                              ),
                              Icon(
                                Icons.delete,
                              ),
                            ],
                          ),
                        ),
                      ),
                      dismissThresholds: const {DismissDirection.startToEnd: 1},
                      confirmDismiss: (direction) {
                        // return confirmDelete(context);
                        return showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text(
                                '삭제 확인',
                              ),
                              content: const Text(
                                '삭제하시겠습니까?',
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    '예',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (() {
                                    Navigator.of(context).pop(false);
                                  }),
                                  child: const Text(
                                    '아니오',
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      },
                      child: GestureDetector(
                        onTap: () async {
                          await Get.toNamed(
                            '/update',
                            parameters: {
                              'code': data[index]['code'],
                              'name': data[index]['name'],
                              'dept': data[index]['dept'],
                              'phone': data[index]['phone'],
                            },
                          );
                          getJsonData();
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Code: ',
                                  ),
                                  Text(
                                    data[index]['code'],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '이름: ',
                                  ),
                                  Text(
                                    data[index]['name'],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '전공: ',
                                  ),
                                  Text(
                                    data[index]['dept'],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '전화번호: ',
                                  ),
                                  Text(
                                    data[index]['phone'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
              ),
      ),
    );
  }

  // --- Functions ---
  Future<bool> getJsonData() async {
    data = [];
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }

  removeInfo() {}
}
