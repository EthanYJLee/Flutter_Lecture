import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // 현재 떠있는 화면을 없앰으로 인해 첫번째 화면이 보이도록 함.
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.red,
          ),
        ),
        child: const Text(
          'Go to the first page',
        ),
      )),
    );
  }
}
