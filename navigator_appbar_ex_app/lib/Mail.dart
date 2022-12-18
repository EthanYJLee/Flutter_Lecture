import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receive');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
