import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late List todoList;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];
    for (int i = 1; i <= 100; i++) {
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: Card(
                color: index % 2 == 0 ? Colors.red : Colors.amberAccent,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (index + (index + 1)) % 3 == 0
                          ? Image.asset('images/pikachu3.png')
                          : index % 3 == 0
                              ? Image.asset('images/pikachu1.png')
                              : Image.asset('images/pikachu2.png'),
                      const Text('-->'),
                      Text(
                        todoList[index].toString(),
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
