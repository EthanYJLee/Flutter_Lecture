import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_tabbar_ex_app/first_page.dart';
import 'package:navigator_tabbar_ex_app/second_page.dart';

class AnimalMain extends StatefulWidget {
  final String id;
  final String pw;
  const AnimalMain({super.key, required this.id, required this.pw});

  @override
  State<AnimalMain> createState() => _AnimalMainState();
}

class _AnimalMainState extends State<AnimalMain>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.blueAccent,
        child: TabBar(
          controller: controller,
          labelColor: Colors.amberAccent,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one),
            ),
            Tab(
              icon: Icon(Icons.looks_two),
            )
          ],
        ),
      ),
    );
  }
}
