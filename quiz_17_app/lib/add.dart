import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_17_app/home.dart';
import 'package:quiz_17_app/model/message.dart';
import 'package:quiz_17_app/model/todo_list.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  late TextEditingController textEditingController;
  // late bool buy;
  // late bool appointment;
  // late bool study;
  late List _imagePath;
  late int selectedItem;
  late DateTime selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    // buy = true;
    // appointment = false;
    // study = false;
    _imagePath = [
      'images/cart.png',
      'images/clock.png',
      'images/pencil.png',
    ];
    selectedItem = 0;
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('구매'),
              //     Switch(
              //         value: buy,
              //         onChanged: ((value) {
              //           setState(() {
              //             buy = value;
              //             if (buy == true) {
              //               appointment = false;
              //               study = false;
              //             } else {
              //               appointment = true;
              //             }
              //           });
              //         })),
              //     Image.asset(
              //       'images/cart.png',
              //       height: 35,
              //       width: 35,
              //     )
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('약속'),
              //     Switch(
              //         value: appointment,
              //         onChanged: ((value) {
              //           setState(() {
              //             appointment = value;
              //             if (appointment == true) {
              //               buy = false;
              //               study = false;
              //             } else {
              //               study = true;
              //             }
              //           });
              //         })),
              //     Image.asset(
              //       'images/clock.png',
              //       height: 35,
              //       width: 35,
              //     )
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('스터디'),
              //     Switch(
              //         value: study,
              //         onChanged: ((value) {
              //           setState(() {
              //             study = value;
              //             if (study == true) {
              //               appointment = false;
              //               buy = false;
              //             } else {
              //               buy = true;
              //             }
              //           });
              //         })),
              //     Image.asset(
              //       'images/pencil.png',
              //       height: 35,
              //       width: 35,
              //     )
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(_imagePath[selectedItem]),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 220,
                    height: 150,
                    child: CupertinoPicker(
                      backgroundColor: Color.fromRGBO(50, 50, 0, 0.2),
                      looping: true,
                      itemExtent: 40,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      children: [
                        for (int i = 0; i < _imagePath.length; i++) ...[
                          Container(
                            child: Image.asset(_imagePath[i]),
                          ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime(2000, 1, 1),
                lastDate: DateTime(2022, 12, 31),
                onDateChanged: ((value) {
                  setState(() {
                    selectedDate = value;
                  });
                }),
              ),
              GestureDetector(
                child: ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isEmpty) {
                      setState(() {
                        _showDialog(context);
                      });
                    } else {
                      setState(() {
                        addToList(context);
                      });
                    }
                  },
                  child: const Text(
                    'OK',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Functions
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: Text('alert'),
          content: Text('목록을 입력하세요'),
          actions: [
            ElevatedButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text(
                'OK',
              ),
            ),
          ],
        );
      }),
    );
  }

  addToList(BuildContext context) {
    Message.workList = textEditingController.text.trim();
    Message.dateTime = selectedDate;
    Message.imagePath = _imagePath[selectedItem];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => Home()),
      ),
    );
  }
}
