import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/table_list.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool buy;
  late bool appointment;
  late bool study;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    buy = true;
    appointment = false;
    study = false;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('구매'),
                  Switch(
                      value: buy,
                      onChanged: ((value) {
                        setState(() {
                          buy = value;
                          if (buy == true) {
                            appointment = false;
                            study = false;
                          } else {
                            appointment = true;
                          }
                        });
                      })),
                  Image.asset(
                    'images/cart.png',
                    height: 35,
                    width: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('약속'),
                  Switch(
                      value: appointment,
                      onChanged: ((value) {
                        setState(() {
                          appointment = value;
                          if (appointment == true) {
                            buy = false;
                            study = false;
                          } else {
                            study = true;
                          }
                        });
                      })),
                  Image.asset(
                    'images/clock.png',
                    height: 35,
                    width: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('스터디'),
                  Switch(
                      value: study,
                      onChanged: ((value) {
                        setState(() {
                          study = value;
                          if (study == true) {
                            appointment = false;
                            buy = false;
                          } else {
                            buy = true;
                          }
                        });
                      })),
                  Image.asset(
                    'images/pencil.png',
                    height: 35,
                    width: 35,
                  )
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '목록을 입력하세요'),
              ),
              const SizedBox(
                height: 50,
              ),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000, 1, 1),
                lastDate: DateTime(2022, 12, 31),
                onDateChanged: ((value) {
                  setState(() {});
                }),
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Functions
  addList() {
    Message.workList = textEditingController.text.trim();
    if (buy == true) {
      Message.imagePath = 'images/cart.png';
    } else if (appointment == true) {
      Message.imagePath = 'images/clock.png';
    } else {
      Message.imagePath = 'images/pencil.png';
    }
    Message.action = true;
  }
} // End
