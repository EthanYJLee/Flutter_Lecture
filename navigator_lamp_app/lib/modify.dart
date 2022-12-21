import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_app/home.dart';
import 'package:navigator_lamp_app/model/input_text.dart';
import 'package:navigator_lamp_app/model/main_state.dart';

class Modify extends StatefulWidget {
  const Modify({super.key});

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  late List<MainState> mainState;
  late List<InputText> inputText;
  late TextEditingController controller;
  late bool onOff;
  late String onOffStr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onOff = true;
    onOffStr = 'On';
    controller = TextEditingController();
    controller.text = InputText.inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(),
                style: TextStyle(),
                onChanged: (value) {
                  value = controller.text.trim();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(onOffStr),
                Switch(
                  value: onOff,
                  onChanged: (value) {
                    setState(() {
                      onOff = value;
                      if (onOff == true) {
                        onOffStr = 'On';
                      } else {
                        onOffStr = 'Off';
                      }
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isEmpty) {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: Text('글자를 입력하세요'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                              ),
                            ),
                          ],
                        );
                      }));
                } else {
                  updateAction(context, controller.text.trim());
                }
              },
              child: Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Functions
  updateAction(BuildContext context, String text) {
    setState(() {
      MainState.modifiedSwitch = onOff;
      MainState.modifiedText = text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => Home()),
        ),
      );
    });
  }
}
