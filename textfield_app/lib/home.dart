import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String inputValue; // 사용자의 입력 내용

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Field'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: '글자를 입력하세요',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      showSnackBar(context);
                    }
                  },
                  child: const Text('출력'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Date: 2022-12-14
  // Desc: 텍스트 필드에 입력 없이 버튼을 눌렀을 경우
  // -----Functions-----
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '글자를 입력하세요',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Date: 2022-12-14
  // Desc: 텍스트 필드에 입력 없이 버튼을 눌렀을 경우
  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '입력한 글자는 ${textEditingController.text} 입니다.',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
} // End
