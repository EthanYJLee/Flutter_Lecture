import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_insert_app/model/add_animal.dart';
import 'package:listview_insert_app/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

enum Species { A, B, C }

class _SecondPageState extends State<SecondPage> {
  final TextEditingController controller = TextEditingController();
  late Species _species;
  late List<AnimalList> list;
  late bool fly;

  late List<AddAnimal> newList;
  late String newName;
  late String newWings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _species = Species.A;
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
    fly = false; // 체크박스
    newName = '';
    newWings = '';
    controller.addListener(() {
      final String text = controller.text.trim();
      controller.value = controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: const SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: ?????????????????????,
                decoration: InputDecoration(labelText: '추가할 동물을 입력하세요.'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: Species.A,
                groupValue: _species,
                onChanged: ((value) {
                  setState(() {
                    _species = value!;
                  });
                }),
              ),
              const Text('양서류'),
              Radio(
                value: Species.B,
                groupValue: _species,
                onChanged: ((value) {
                  setState(() {
                    _species = value!;
                  });
                }),
              ),
              const Text('파충류'),
              Radio(
                value: Species.C,
                groupValue: _species,
                onChanged: ((value) {
                  setState(() {
                    _species = value!;
                  });
                }),
              ),
              const Text('포유류'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('날 수 있나요?'),
              Checkbox(
                value: fly,
                onChanged: ((value) {
                  setState(() {
                    fly = value!;
                  });
                }),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return Row(
                  children: [
                    Image.asset(
                      list[index].imagePath,
                      height: 100,
                    ),
                  ],
                );
              }),
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              setState(() {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text('동물 추가하기'),
                      content: const Text('이동물은~~~'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            insertAnimal();
                          },
                          child: const Text('예'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('아니오'),
                        ),
                      ],
                    );
                  }),
                );
              });
            }),
            child: const Text(
              '동물 추가하기',
            ),
          ),
          const SizedBox(
            height: 350,
          ),
        ],
      ),
    ));
  }

  // Functions
  insertAnimal() {}
}
