import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late String imageName;
late bool lampStatus;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = 'images/lamp_on.png';
    lampStatus = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              height: 300,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _turnOn(context),
                  child: Text('켜기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    turnOff();
                  },
                  child: Text('끄기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _turnOn(BuildContext context) {
    if (lampStatus == true) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('경고'),
              content: Text('현재 램프가 켜진 상태입니다.'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('네, 알겠습니다.'),
                )
              ],
            );
          });
    }
  }

  turnOff() {}
}
