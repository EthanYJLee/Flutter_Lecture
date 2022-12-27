import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController userIdController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nicknameController = TextEditingController();
  late String uId;
  late String uPassword;
  late String uNickname;
  FocusNode idFocus = FocusNode();
  FocusNode pwFocus = FocusNode();
  FocusNode nickFocus = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uId = '';
    uPassword = '';
    uNickname = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        idFocus.unfocus();
        pwFocus.unfocus();
        nickFocus.unfocus();
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
          ),
          backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  controller: userIdController,
                  focusNode: idFocus,
                  decoration: const InputDecoration(
                    labelText: 'ID를 입력해주세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  controller: passwordController,
                  focusNode: pwFocus,
                  decoration: const InputDecoration(
                    labelText: '비밀번호를 입력해주세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextField(
                  controller: nicknameController,
                  focusNode: nickFocus,
                  decoration: const InputDecoration(
                    labelText: '닉네임을 입력해주세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (userIdController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty &&
                        nicknameController.text.trim().isNotEmpty) {
                      uId = userIdController.text.trim();
                      uPassword = passwordController.text.trim();
                      uNickname = nicknameController.text.trim();
                      getJSONData();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                  ),
                  child: const Text(
                    '회원가입',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----- Functions -----
  // Desc: MySQL DB에 가입 정보 insert
  // 2022.12.26
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter_Semi/user_insert_flutter.jsp?uId=$uId&uPassword=$uPassword&uNickname=$uNickname');
    await http.get(url);
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('입력 결과'),
            content: const Text('입력이 완료되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text(
                  '완료',
                ),
              ),
            ],
          );
        });
  }
}
