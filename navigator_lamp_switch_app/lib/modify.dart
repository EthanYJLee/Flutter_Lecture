import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_switch_app/home.dart';

class Modify extends StatefulWidget {
  const Modify({super.key});

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  late bool switchRed;
  late bool switchOff;
  late String result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchRed = false;
    switchOff = false;
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red'),
                Switch(
                    value: switchRed,
                    onChanged: (value) {
                      setState(() {
                        switchRed = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Off'),
                Switch(
                    value: switchOff,
                    onChanged: (value) {
                      setState(() {
                        switchOff = value;
                      });
                    }),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                switchRed == true
                    ? result = 'images/lamp_red.png'
                    : switchOff == true
                        ? result = 'images/lamp_off.png'
                        : result = 'images/lamp_on.png';
                switchMode(context, result);
              },
              child: Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }

  switchMode(BuildContext context, String result) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => Home()),
        ),
      ).then((value) => value);
    });
  }
}
