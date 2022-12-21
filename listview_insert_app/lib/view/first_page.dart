import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late List<AnimalList> list;
  late String fly;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [];
    list.add(AnimalList(
        imagePath: 'images/bee.png', animalName: '벌', category: '곤충'));
    list.add(AnimalList(
        imagePath: 'images/cat.png', animalName: '고양이', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/cow.png', animalName: '젖소', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/dog.png', animalName: '강아지', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/cow.png', animalName: '여우', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/monkey.png', animalName: '원숭이', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/pig.png', animalName: '돼지', category: '포유류'));
    list.add(AnimalList(
        imagePath: 'images/wolf.png', animalName: '늑대', category: '포유류'));
    fly = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              flyOrNot(index);
              setState(() {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(list[index].animalName),
                        content: Text(
                            '이 동물은 ${list[index].category} 입니다.\n날 수 $fly습니다.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '종료',
                            ),
                          ),
                        ],
                      );
                    });
              });
            },
            child: Column(
              children: [
                Card(
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Image.asset(list[index].imagePath),
                        Text(list[index].animalName)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  //  Functions
  flyOrNot(index) {
    if (list[index].category == '곤충') {
      fly = '있';
    } else {
      fly = '없';
    }
  }
}
