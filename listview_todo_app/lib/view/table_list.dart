import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/detail_list.dart';
import 'package:listview_todo_app/view/insert_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  late List<TodoList> todoList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];
    todoList.add(TodoList(
      imagePath: 'images/cart.png',
      workList: '책구매',
      dateTime: DateTime(2022, 1, 1),
    ));
    todoList.add(TodoList(
      imagePath: 'images/clock.png',
      workList: '철수와 약속',
      dateTime: DateTime(2022, 1, 1),
    ));
    todoList.add(TodoList(
      imagePath: 'images/pencil.png',
      workList: '스터디 준비',
      dateTime: DateTime(2022, 1, 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              // insert view로 넘어가서 입력을 마치고 다시 돌아올 때 main view에 적용해주는 프로세스가 필요하다
              Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[position].workList;
                Message.imagePath = todoList[position].imagePath;
                Message.dateTime = todoList[position].dateTime;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const DetailList()),
                    ));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(todoList[position].imagePath),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(todoList[position].workList),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(todoList[position].dateTime)
                          .toString(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Functions
  rebuildData() {
    setState(() {
      if (Message.action == true) {
        todoList.add(TodoList(
            imagePath: Message.imagePath,
            workList: Message.workList,
            dateTime: Message.dateTime));
        Message.action = false;
      }
    });
  }
} // End
