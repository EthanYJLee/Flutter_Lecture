import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: const Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
