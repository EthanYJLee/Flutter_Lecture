import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List _imageName;
  late int selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = [
      'images/flower_01.png',
      'images/flower_02.png',
      'images/flower_03.png',
      'images/flower_04.png',
      'images/flower_05.png',
      'images/flower_06.png'
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker View로 이미지 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 300,
                height: 250,
                child: CupertinoPicker(
                    backgroundColor: Colors.amber,
                    itemExtent: 30,
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    onSelectedItemChanged: ((value) {
                      setState(() {
                        selectedItem = value;
                      });
                    }),
                    children: [
                      Text(_imageName[0]),
                      Text(_imageName[1]),
                      Text(_imageName[2]),
                      Text(_imageName[3]),
                      Text(_imageName[4]),
                      Text(_imageName[5]),
                    ]),
              ),
            ),
            Text('Selected Item : ${_imageName[selectedItem]}'),
            Image.asset(
              '${_imageName[selectedItem]}',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
