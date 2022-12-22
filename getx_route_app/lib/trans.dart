import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Trans extends StatefulWidget {
  const Trans({super.key});

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
