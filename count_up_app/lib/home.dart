import 'package:count_up_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $count 입니다.'),
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.add),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    count = 0;
                  });
                },
                child: const Text('Reset'))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     setState(() {
      //       count++;
      //     });
      //   },
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}
