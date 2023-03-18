import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_pattern_sample/mvvm/viewmodel/mvvm_viewmodel.dart';

class MVVMView extends StatelessWidget {
  MVVMView({Key? key}) : super(key: key);

  MvvmViewModel viewModel = MvvmViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Pattern'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ViewModel과 View는 연관성이 없어야 하므로 StreamBuilder를 사용한다.
            StreamBuilder(
              stream: viewModel.mvvmStream,
              builder: ((context, snapshot) {
                return Text(
                  viewModel.count.toString(),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (() {
                      viewModel.incrementCounter();
                    }),
                    child: const Text('+'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (() {
                      viewModel.decrementCounter();
                    }),
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
