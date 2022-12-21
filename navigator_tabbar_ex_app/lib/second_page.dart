import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_tabbar_ex_app/model/add_animal.dart';
import 'package:navigator_tabbar_ex_app/model/animal_list.dart';
import 'package:select_card/select_card.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

enum Species { A, B, C }

class _SecondPageState extends State<SecondPage> {
  late TextEditingController animalController;
  late Species _species;
  late List<AnimalList> list;
  late bool fly;

  // 새로 추가하는 동물의 이름, 종, 비행여부, 이미지
  late List<AddAnimal> newList;
  late String newName;
  late String newWings;
  late String newSpecies;
  late String newImage;
  // select group card에 필요한 list
  late List<String> cardTitle;
  late List<String> cardImage;

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
    newSpecies = '';
    newImage = '';
    animalController = TextEditingController();
    cardTitle = [];
    for (int i = 0; i < list.length; i++) {
      cardTitle.add(list[i].animalName);
    }
    cardImage = [];
    for (int i = 0; i < list.length; i++) {
      cardImage.add(list[i].imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: animalController,
                decoration: InputDecoration(labelText: '추가할 동물을 입력하세요.'),
              ),
            ),
            SizedBox(
              height: 20,
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
            Container(
              height: 150,
              child: Expanded(
                flex: 3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      child: SingleChildScrollView(
                        child: SelectGroupCard(
                          context,
                          titles: cardTitle,
                          images: cardImage,
                          onTap: (index) {
                            newImage = index;
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (animalController.text.trim().isEmpty) {
                  textSnackBar(context);
                } else {
                  if (_species == Species.A) {
                    newSpecies = '양서류';
                  }
                  if (_species == Species.B) {
                    newSpecies = '파충류';
                  }
                  if (_species == Species.C) {
                    newSpecies = '포유류';
                  }

                  _showDialog(context, animalController.text, newSpecies);
                }
              },
              child: Text('동물 추가하기'),
            ),
            const SizedBox(
              height: 350,
            ),
          ],
        ),
      ),
    ));
  }

  // Functions
  textSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('추가할 동물을 입력해주세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  _showDialog(BuildContext context, String animalName, String animalSpecies) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('동물 추가'),
          content: Text('추가할 동물의 이름은 $animalName 이고 $animalSpecies 입니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '예',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '아니오',
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      }),
    );
  }
}
