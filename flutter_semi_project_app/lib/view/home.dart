import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/view/calendar.dart';
import 'package:flutter_semi_project_app/view/my_page.dart';
import 'package:flutter_semi_project_app/view/view_all_photos.dart';

class Home extends StatefulWidget {
  final String userId;
  final String password;

  const Home({required this.userId, required this.password});

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
      body: TabBarView(
        controller: controller,
        children: const [
          Calendar(),
          ViewAllPhotos(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Color.fromARGB(255, 138, 143, 239),
        child: TabBar(
            controller: controller,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                child: Icon(
                  Icons.calendar_month,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.add_a_photo,
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
