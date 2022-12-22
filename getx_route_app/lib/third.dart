import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/trans.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  late var id;
  late var name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = Get.parameters['id'] ?? '_';
    name = Get.parameters['name'] ?? '_';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third',
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
                  Get.back();
                },
                child: const Text(
                  'Get.back()',
                ),
              ),
            ),
            Text('ID: $id'),
            Text('이름: $name'),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Get.to(const Trans());
                },
                child: const Text('Translate'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
