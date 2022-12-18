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
  late bool _sizeSwitch;
  late bool _onOffSwitch;
  late bool _colorSwitch;
  late String _lampStatus; // 현재 화면의 Lamp on/off status

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _sizeSwitch = false;
    _onOffSwitch = true;
    _colorSwitch = false;
    _lampStatus = 'on';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Image 확대 및 축소'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(0 / 360),
                  child: Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '전구 색깔',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Switch(
                          value: _colorSwitch,
                          onChanged: (lampcolor) {
                            setState(() {
                              _colorSwitch = lampcolor;
                            });
                            decisionLampColor();
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          '전구 확대',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Switch(
                          value: _sizeSwitch,
                          onChanged: (lampsize) {
                            setState(() {
                              _sizeSwitch = lampsize;
                            });
                            decisionLampSize();
                          },
                        ),
                      ],
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
                          value: _onOffSwitch,
                          onChanged: (lamponoff) {
                            setState(() {
                              _onOffSwitch = lamponoff;
                            });
                            decisionLampOnOff();
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
      ),
    );
  }

  // ----- Functions -----
  decisionLampColor() {
    if (_colorSwitch == true) {
      setState(() {
        _lampImage = 'images/lamp_red.png';
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_on.png';
      });
    }
  }

  decisionLampSize() {
    if (_sizeSwitch == true) {
      setState(() {
        _lampWidth = 300;
        _lampHeight = 600;
      });
    } else {
      setState(() {
        _lampWidth = 150;
        _lampHeight = 300;
      });
    }
  }

  decisionLampOnOff() {
    if (_onOffSwitch == true) {
      setState(() {
        _lampImage = 'images/lamp_on.png';
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_off.png';
      });
    }
  }
} // End
// TODO Implement this library.