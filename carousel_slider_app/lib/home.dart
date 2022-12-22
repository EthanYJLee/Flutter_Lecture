import 'package:carousel_slider_app/first_page.dart';
import 'package:carousel_slider_app/second_page.dart';
import 'package:carousel_slider_app/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maple Story'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: TabBar(
          controller: controller,
          tabs: const [
            Icon(
              Icons.home,
              color: Colors.amberAccent,
              size: 30,
            ),
            Icon(
              Icons.check,
              color: Colors.amberAccent,
              size: 30,
            ),
            Icon(
              Icons.person,
              color: Colors.amberAccent,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
