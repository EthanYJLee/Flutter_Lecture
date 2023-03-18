import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mvvm_pattern_sample/mvvm/view/mvvm_view.dart';
import 'package:mvvm_pattern_sample/mvvm_getx/mvvm_getx_controller.dart';
import 'package:mvvm_pattern_sample/mvvm_getx/mvvm_getx_view.dart';
import 'package:mvvm_pattern_sample/mvvm_provider/mvvm_provider_controller.dart';
import 'package:mvvm_pattern_sample/mvvm_provider/mvvm_provider_view.dart';
import 'package:provider/provider.dart';

class PatternHome extends StatefulWidget {
  const PatternHome({super.key});

  @override
  State<PatternHome> createState() => _PatternHomeState();
}

class _PatternHomeState extends State<PatternHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pattern Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MVVMView()),
                  ),
                );
              },
              child: const Text(
                'MVVM Pattern',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        ChangeNotifierProvider<MVVMProviderController>.value(
                          value: MVVMProviderController(),
                          child: MVVMProviderView(),
                        )),
                  ),
                );
              },
              child: const Text(
                'MVVM Provider Pattern',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // get to로 page이동
                Get.to(
                  MVVMGetxView(),
                  // binding builder로 controller 등록
                  binding: BindingsBuilder(
                    (() {
                      Get.put(MVVMGetxController());
                    }),
                  ),
                );
              },
              child: const Text(
                'MVVM GetX Pattern',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
