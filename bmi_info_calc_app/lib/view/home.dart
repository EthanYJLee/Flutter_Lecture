import 'package:bmi_info_calc_app/view/calc.dart';
import 'package:bmi_info_calc_app/view/info.dart';
import 'package:bmi_info_calc_app/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // bottomNaviga
        appBar: AppBar(
          toolbarHeight: 20,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info),
                text: '  BMI 정보\n(BMI Info)',
              ),
              Tab(
                icon: Icon(Icons.calculate),
                text: '       BMI 계산\n(Calculate BMI)',
              ),
              Tab(
                icon: Icon(Icons.man),
                text: '   내 정보\n(My Info)',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [Info(), Calc(), Profile()],
        ),
      ),
    );
  }
}
