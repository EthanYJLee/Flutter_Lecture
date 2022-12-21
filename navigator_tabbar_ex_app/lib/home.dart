import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('images/login.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: '패스워드를 입력하세요',
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // ID/PW 빈 칸이면 snack bar
                  if (userIdController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    errorSnackBar(context);
                  } else {
                    // check ID, PW
                    if (userIdController.text.trim() == 'root' &&
                        passwordController.text.trim() == 'qwer1234') {
                      _showDialog(context, userIdController.text,
                          passwordController.text);
                      // ID와 PW: dialog로 전달 => 다음 view로 전달
                    } else {
                      checkSnackBar(context);
                    }
                  }
                },
                child: const Text(
                  'Log In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Functions

  // --------------------------------------
  // Desc: ID 와 PW 빈 칸 여부 확인용
  // Date: 2022.12.20
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        '사용자 ID와 PW를 입력하세요.',
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
  // --------------------------------------

  // --------------------------------------
  // Desc: ID와 PW가 일치할 경우 dialog로 넘겨주는 용도 (+다음 View로) (필요에 의해)
  // Date: 2022.12.20
  _showDialog(BuildContext context, String userId, String password) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text('환영합니다!'),
          content: Text('신분이 확인되었습니다.'),
          actions: [
            ElevatedButton(
              onPressed: (() {
                // OK버튼 누르면 ID와 PW 정보 담아서 전달
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return AnimalMain(
                        id: userId,
                        pw: password,
                      );
                    }),
                  ),
                );
              }),
              child: Text(
                'OK',
              ),
            ),
          ],
        );
      }),
    );
  }
  // --------------------------------------

  // --------------------------------------
  // Desc: ID or PW 불일치
  // Date: 2022.12.20
  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        '사용자 ID나 PW가 일치하지 않습니다.',
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
  // --------------------------------------
}
