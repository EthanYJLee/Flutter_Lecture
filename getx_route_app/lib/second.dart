import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/third.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var singleValue = Get.arguments ?? 'no arg';
  var multiValue = Get.arguments ?? 'XX';
  // null safety (null 병합연산자 ??) 지정해줘야 함. (값이 없으면 _)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second',
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.back(
                    result: "Good",
                  );
                },
                child: const Text(
                  '[Home] Get.back()',
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const Third());
                },
                child: const Text(
                  '[Third] Get.to()',
                ),
              ),
            ),
            Text('Single Argument: $singleValue'),
            Text('Multiple Argument #1: ${multiValue[0]}'),
            Text('Multiple Argument #2: ${multiValue[1]}'),
          ],
        ),
      ),
    );
  }
}
