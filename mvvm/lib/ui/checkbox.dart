import 'package:flutter/material.dart';
import 'package:mvvm/viewmodel/controller.dart';
import 'package:provider/provider.dart';

class Checkbox_example extends StatelessWidget {
  late ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ViewModel>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'checkbox example',
          ),
        ),
        body: Column(
          children: [
            Switch(
              value: viewModel.value,
              onChanged: (value) {
                viewModel.changeValue();
              },
            ),
            TextField(
              controller: viewModel.textCont,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.dialog(context);
              },
              child: const Text(
                'Confirm',
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
