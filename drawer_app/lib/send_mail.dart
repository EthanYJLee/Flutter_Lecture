import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SendMail extends StatelessWidget {
  const SendMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: const Text('Send Mail'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
