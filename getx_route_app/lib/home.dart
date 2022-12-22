import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:getx_route_app/second.dart';
import 'package:getx_route_app/third.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Route 관리',
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Navigation',
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    const Second(),
                  );
                },
                child: const Text(
                  'Get.to() 화면 이동',
                ),
              ),
            ),
            const Text('Snack Bar'),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Snack Bar',
                    'Message',
                    backgroundColor: Colors.yellowAccent,
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(
                      milliseconds: 900,
                    ),
                  );
                },
                child: const Text(
                  'Snack Bar',
                ),
              ),
            ),
            const Text('Dialog'),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Dialog',
                    middleText: 'Message',
                    actions: [
                      TextButton(
                        onPressed: (() {
                          Get.back();
                        }),
                        child: const Text(
                          'Exit',
                        ),
                      ),
                    ],
                  );
                },
                child: const Text(
                  'Dialog',
                ),
              ),
            ),
            const Text('Bottom Sheet'),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    height: 300,
                    color: Colors.purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Text Line1'),
                        Text('Text Line2'),
                        Text('Text Line3'),
                      ],
                    ),
                  ));
                },
                child: const Text(
                  'Bottom Sheet',
                ),
              ),
            ),
            Text('Arguments'),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    const Second(),
                    arguments: 'argument',
                    transition: Transition.zoom,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
                child: const Text(
                  '[Second] Get.to(): Single Arguments',
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    const Second(),
                    arguments: ['First', 'Second'],
                    transition: Transition.zoom,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
                child: const Text(
                  '[Second] Get.to(): Multi Arguments',
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  var returnValue = await Get.to(
                    const Second(),
                    arguments: ['First', 'Second'],
                  );
                  Get.snackbar('Return Value', '$returnValue',
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text(
                  '[Second] Get.to(): Return Arguments',
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                minWidth: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/third',
                      parameters: {'id': 'root', 'name': '루트'});
                },
                child: const Text(
                  '[Third] Get.toNamed(): Parameters',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
