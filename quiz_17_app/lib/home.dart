import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:quiz_17_app/add.dart';
import 'package:quiz_17_app/detail.dart';
import 'package:quiz_17_app/model/message.dart';
import 'package:quiz_17_app/model/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Add()),
                ),
              );
            },
            icon: Icon(
              Icons.add,
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
                      builder: ((context) => const DetailView()),
                    ));
              },
              child: Card(
                color: Color.fromRGBO(120, 50, 0, 0.2),
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
}
