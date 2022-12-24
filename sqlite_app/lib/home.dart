import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/database_handler.dart';
import 'package:sqlite_app/insert_student.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/update_students.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    // whenComplete는 hold하는 용도로 쓰임.

    handler.initializeDB().whenComplete(() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SQLite for Students'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return InsertStudent();
                    }),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        // FutureBuilder: 생성되면서 화면이 만들어짐
        body: FutureBuilder(
          future:
              handler.queryStudents(), // handler가 queryStudents 실행하면서 view 생성
          builder:
              (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      // await Get.toNamed('/update', parameters: {
                      //   'code': '${snapshot.data?[index].code}',
                      //   'name': '${snapshot.data?[index].name}',
                      //   'dept': '${snapshot.data?[index].dept}',
                      //   'phone': '${snapshot.data?[index].phone}',
                      // })?.then((value) => handler.initializeDB());
                      Students students = Students(
                          code: '${snapshot.data?[index].code}',
                          name: '${snapshot.data?[index].name}',
                          dept: '${snapshot.data?[index].dept}',
                          phone: '${snapshot.data?[index].phone}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => UpdateStudent()),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text('Code : ${snapshot.data?[index].code}'),
                          Text('이름 : ${snapshot.data?[index].name}'),
                          Text('전공 : ${snapshot.data?[index].dept}'),
                          Text('전화번호 : ${snapshot.data?[index].phone}')
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  // ----- Functions -----

}
