import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController firstController;
  late TextEditingController secondController;
  late TextEditingController add;
  late TextEditingController sub;
  late TextEditingController mul;
  late TextEditingController div;

  late int firstNum;
  late int secondNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstController = TextEditingController();
    secondController = TextEditingController();
    add = TextEditingController();
    sub = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();

    firstNum = 0;
    secondNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: firstController,
                      decoration: const InputDecoration(
                        labelText: '첫번째 숫자를 입력하세요',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: secondController,
                      decoration: const InputDecoration(
                        labelText: '두번째 숫자를 입력하세요',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (firstController.text.trim().isEmpty ||
                              secondController.text.trim().isEmpty) {
                            errorSnackBar(context);
                          } else {
                            setState(() {
                              firstNum = int.parse(firstController.text);
                              secondNum = int.parse(secondController.text);
                              add.text = (firstNum + secondNum).toString();
                              sub.text = (firstNum - secondNum).toString();
                              mul.text = (firstNum * secondNum).toString();
                              div.text = (firstNum / secondNum).toString();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                        ),
                        label: const Text('계산하기'),
                        icon: const Icon(Icons.question_mark),
                        // row로 묶어도 됨 (Icon, SizedBox, Text)
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton(
                        onPressed: () {
                          firstController.text = '';
                          secondController.text = '';
                        },
                        child: const Text('지우기'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(150, 50)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      TextField(
                        readOnly: true,
                        controller: add,
                        decoration: const InputDecoration(
                          labelText: '덧셈 결과',
                        ),
                      ),
                      TextField(
                        controller: sub,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: '뺄셈 결과',
                        ),
                      ),
                      TextField(
                        controller: mul,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: '곱셈 결과',
                        ),
                      ),
                      TextField(
                        controller: div,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: '나눗셈 결과',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // -----Functions-----
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 입력하세요',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // End
