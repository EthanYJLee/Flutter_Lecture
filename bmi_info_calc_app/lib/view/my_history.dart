import 'package:bmi_info_calc_app/model/bmi_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHistory extends StatefulWidget {
  const MyHistory({super.key});

  @override
  State<MyHistory> createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 BMI 기록'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 100,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    BMIHistory.bmi,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    BMIHistory.bmiResult,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
