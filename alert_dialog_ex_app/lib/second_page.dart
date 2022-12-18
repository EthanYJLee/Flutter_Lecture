import 'package:alert_dialog_ex_app/home.dart';
import 'package:alert_dialog_ex_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('2번째 페이지입니다.'),
            ElevatedButton(
              onPressed: () {},
              child: Text('메인으로'),
            ),
          ],
        ),
      ),
    );
  }
}
