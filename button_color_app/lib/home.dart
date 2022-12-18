import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String btnText;
  late Color btnColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    btnText = 'Hello';
    btnColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (btnText == 'Hello') {
                btnText = 'Flutter';
                btnColor = Color.fromARGB(255, 241, 179, 32);
              } else {
                btnText = 'Hello';
                btnColor = Colors.blue;
              }
            });
          },
          child: Text(
            btnText,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
          ),
        ),
      ),
    );
  }
} // End
