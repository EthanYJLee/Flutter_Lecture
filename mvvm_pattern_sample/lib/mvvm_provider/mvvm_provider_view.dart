import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_pattern_sample/mvvm_provider/mvvm_provider_controller.dart';
import 'package:provider/provider.dart';

class MVVMProviderView extends StatelessWidget {
  MVVMProviderView({Key? key}) : super(key: key);

  MVVMProviderController? controller;

  @override
  Widget build(BuildContext context) {
    // controller를 context로부터 받아오며, 현재 이 위젯은 참조하지 않겠다고 선언
    // (실질적으로 참조해야 하는 위젯은 Consumer)
    controller = Provider.of<MVVMProviderController>(context, listen: false);
    //**
    // context.read<T>()와 동일함
    // (context.watch<T>()는 Provider.of<T>(context)와 동일)
    // */
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Provider Pattern'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer == 구독
            // 하나의 build 메소드에서 provider를 생성도 하고 소비도 해야 하는 상황일 때 사용한다.
            Consumer<MVVMProviderController>(
              builder: (context, value, child) {
                return Text(
                  controller!.count.toString(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller!.incrementCounter();
                    },
                    child: const Text('+'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller!.decrementCounter();
                    },
                    child: const Text('-'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
