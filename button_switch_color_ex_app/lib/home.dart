import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color btnColor;
  late bool switchState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    btnColor = Colors.blue;
    switchState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (btnColor == Colors.blue) {
                    btnColor = Colors.red;
                    switchState = true;
                  } else {
                    btnColor = Colors.blue;
                    switchState = false;
                  }
                });
              },
              child: Text(
                'Flutter',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: btnColor,
              ),
            ),
            Switch(
              value: switchState,
              onChanged: (value) {
                setState(() {
                  switchState = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
} // End
