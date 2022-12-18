import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/first_page.dart';
import 'package:flutter_application_1/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellowAccent,
        height: 200,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: 'One',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: 'Two',
            ),
          ],
        ),
      ),
    );
  }
}
