import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_app/model/input_text.dart';
import 'package:navigator_lamp_app/model/main_state.dart';
import 'package:navigator_lamp_app/modify.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controller;
  late String lampImage;
  late String mainText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    lampImage = 'images/lamp_on.png';
    mainText = 'abc';
    controller.text = MainState.modifiedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        leading: Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {
              InputText.inputText = controller.text.trim();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Modify()),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: '글자를 입력하세요'),
              ),
            ),
            Image.asset(
              lampImage,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
