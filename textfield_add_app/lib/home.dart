import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController firstController;
  late TextEditingController secondController;
  late int firstNum;
  late int secondNum;
  late int resultNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstController = TextEditingController();
    secondController = TextEditingController();
    firstNum = 0;
    secondNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('덧셈 구하기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: firstController,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: secondController,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (firstController.text.trim().isEmpty ||
                        secondController.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      setState(() {
                        firstNum = int.parse(firstController.text);
                        secondNum = int.parse(secondController.text);
                        resultNum = firstNum + secondNum;
                      });
                    }
                  },
                  child: const Text('덧셈 계산'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '입력하신 숫자의 합은 $resultNum 입니다.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -----Functions-----
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '숫자를 입력하세요',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // End
