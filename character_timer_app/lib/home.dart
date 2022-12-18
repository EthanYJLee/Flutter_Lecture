import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late List list;
late String str;
late String ad;
late int arr;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = str.split('');
    str = '대한민국';
    ad = '';
    arr = 0;

    // Timer 설치
    Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          arr++;
          ad = ad + list[arr];
          if (arr + 1 >= list.length) {
            arr = 0;
            ad = '';
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ad,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
