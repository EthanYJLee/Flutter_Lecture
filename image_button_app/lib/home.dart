import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imageName;
  late int currentImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName[currentImage]),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                'images/${imageName[currentImage]}',
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    moveBack();
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp),
                  label: Text('이전'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    moveForward();
                  },
                  label: Text('이전'),
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  moveBack() {
    setState(() {});
  }

  moveForward() {
    setState(() {});
  }
}
