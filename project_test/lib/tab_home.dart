import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabHome extends StatefulWidget {
  final String userId;
  final String password;

  const TabHome({required this.userId, required this.password});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with SingleTickerProviderStateMixin {
  late TabController controller;
  // late DatabaseHandler handler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    // handler = DatabaseHandler();
    // handler.initializeDB().whenComplete(() async {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.amber,
        child: TabBar(
            controller: controller,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                child: Icon(
                  Icons.home,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.location_on,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.message_outlined,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.person,
                ),
              ),
            ]),
      ),
    );
  }
}
