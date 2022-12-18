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

  late bool addSwitch;
  late bool subSwitch;
  late bool mulSwitch;
  late bool divSwitch;
  late bool allSwitch;

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
    addSwitch = false;
    subSwitch = false;
    mulSwitch = false;
    divSwitch = false;
    allSwitch = false;

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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //-
          },
          icon: Icon(Icons.add),
          label: Text('save'),
          backgroundColor: Colors.blueGrey,
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('간단한 계산기'),
          backgroundColor: Colors.blueGrey,
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
                              if (addSwitch == true) {
                                add.text = (firstNum + secondNum).toString();
                              } else {
                                add.text = '';
                              }
                              if (subSwitch == true) {
                                sub.text = (firstNum - secondNum).toString();
                              } else {
                                sub.text = '';
                              }
                              if (mulSwitch == true) {
                                mul.text = (firstNum * secondNum).toString();
                              } else {
                                mul.text = '';
                              }
                              if (divSwitch == true) {
                                div.text =
                                    (firstNum / secondNum).toStringAsFixed(2);
                              } else {
                                div.text = '';
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 30),
                        ),
                        label: const Text('계산하기'),
                        icon: const Icon(Icons.question_mark),
                        // row로 묶어도 됨 (Icon, SizedBox, Text)
                      ),
                      const SizedBox(width: 50),
                      ElevatedButton.icon(
                        onPressed: () {
                          firstController.text = '';
                          secondController.text = '';
                        },
                        label: const Text('지우기'),
                        icon: Icon(Icons.warning),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(100, 30)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('덧셈:'),
                      Switch(
                          value: addSwitch,
                          onChanged: (value) {
                            setState(() {
                              addSwitch = value;
                            });
                          }),
                      Text('뺄셈:'),
                      Switch(
                          value: subSwitch,
                          onChanged: (value) {
                            setState(() {
                              subSwitch = value;
                            });
                          }),
                      Text('곱셈:'),
                      Switch(
                          value: mulSwitch,
                          onChanged: (value) {
                            setState(() {
                              mulSwitch = value;
                            });
                          }),
                      Text('나눗셈:'),
                      Switch(
                          value: divSwitch,
                          onChanged: (value) {
                            setState(() {
                              divSwitch = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('전체'),
                      Switch(
                          value: allSwitch,
                          onChanged: (value) {
                            setState(() {
                              allSwitch = value;
                              if (allSwitch == true) {
                                addSwitch = true;
                                subSwitch = true;
                                mulSwitch = true;
                                divSwitch = true;
                              } else {
                                addSwitch = false;
                                subSwitch = false;
                                mulSwitch = false;
                                divSwitch = false;
                              }
                            });
                          }),
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
