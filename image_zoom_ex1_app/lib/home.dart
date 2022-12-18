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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _sizeSwitch = false;
    _onOffSwitch = true;
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
                  turns: const AlwaysStoppedAnimation(45 / 360),
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
                          '전구 확대',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Switch(
                          value: _sizeSwitch,
                          onChanged: (largesmall) {
                            setState(() {
                              _sizeSwitch = largesmall;
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
                          onChanged: (onoff) {
                            setState(() {
                              _onOffSwitch = onoff;
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
      ),
    );
  }

  // ----- Functions -----
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

  decisionOnOff() {
    if (_onOffSwitch == true) {
      setState(() {
        _lampImage = 'images/lamp_off.png';
        _onOffSwitch = false;
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_on.png';
        _onOffSwitch = true;
      });
    }
  }
} // End
