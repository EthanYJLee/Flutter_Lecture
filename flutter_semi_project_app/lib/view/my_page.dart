import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/kakao_login.dart';
import 'package:flutter_semi_project_app/model/main_view_model.dart';
import 'package:flutter_semi_project_app/view/login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Header',
              ),
            ),
            ListTile(
              title: const Text('공지사항'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('문의하기'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('회원탈퇴'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'My Page',
        ),
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text(
                          '로그아웃',
                        ),
                        content: const Text(
                          '로그아웃하시겠습니까?',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              _logout(context);
                            },
                            child: const Text(
                              '예',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '아니오',
                            ),
                          ),
                        ],
                      );
                    }));
              },
              child: const Text(
                'Log Out',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----
  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  _logout(BuildContext context) async {
    await viewModel.logout();
    _disposeSharedPreferences();

    //**
    // pop을 두 번 하면 카카오 로그인 화면이 남고,
    // 세 번 하면 일반 유저가 로그인 했을 경우 로그인 화면까지 날아감
    // pushnamed 쓸지 pop 쓸지 정할것
    // */
    setState(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: ((context) => Login()),
          ),
          (route) => false);
    });
  }
}
