import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // Image Size Control
  late bool _switch; // Switch On/Off
  late String _lampSizeStatus; // 현재 화면의 Lamp Size

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = '이미지 확대';
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _lampImage,
                width: _lampWidth,
                height: _lampHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      decisionLampSize();
                    },
                    child: Text(
                      _buttonName,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Switch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                            _switch = value;
                          });
                          decisionOnOff();
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ----- Functions -----
  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      setState(() {
        _lampWidth = 300;
        _lampHeight = 600;
        _buttonName = '이미지 축소';
        _lampSizeStatus = 'large';
      });
    } else {
      setState(() {
        _lampWidth = 150;
        _lampHeight = 300;
        _buttonName = '이미지 확대';
        _lampSizeStatus = 'small';
      });
    }
  }

  decisionOnOff() {
    if (_switch == true) {
      setState(() {
        _lampImage = 'images/lamp_off.png';
        _switch = false;
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_on.png';
        _switch = true;
      });
    }
  }
} // End
