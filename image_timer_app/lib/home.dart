import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late List imageName;
late int currentImage;

class _HomeState extends State<Home> {
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

    // Timer 설치
    Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        changeImage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
                height: 600,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeImage() {
    setState(() {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }
}
