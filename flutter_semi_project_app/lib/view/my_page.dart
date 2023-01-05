import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/dao/database_handler.dart';
import 'package:flutter_semi_project_app/kakao_login.dart';
import 'package:flutter_semi_project_app/model/main_view_model.dart';
import 'package:flutter_semi_project_app/view/login.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late DatabaseHandler handler;
  final viewModel = MainViewModel(KakaoLogin());
  late String uId;
  late String uPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSharedPreferences();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                '내 정보',
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
                // Navigator.pop(context);
                _showDialog(context);
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
                              close();
                              _logout(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 138, 143, 239),
                            ),
                            child: const Text(
                              '예',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 138, 143, 239),
                            ),
                            child: const Text(
                              '아니오',
                            ),
                          ),
                        ],
                      );
                    }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 138, 143, 239),
              ),
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

    // 2022.12.25
    // kakao login시 popAndPushNamed로 page 하나를 줄여서 일반 로그인과 동일하게 설정한 후
    // pop 두번 되면 로그인 화면으로 돌아가도록 통일함
    setState(() {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  // 회원탈퇴시 확인 Dialog 출력
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('회원탈퇴'),
            content: const Text('탈퇴하시겠습니까?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  _deleteAccountAction(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('탈퇴하기'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                ),
                child: const Text('취소'),
              ),
            ],
          );
        }));
  }

  // ----- Functions -----
  // 일반회원정보 가져오기 (회원탈퇴, 로그아웃)
  // 2022.12.28
  _getSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    uId = pref.getString('p_userId').toString();
    uPassword = pref.getString('p_password').toString();
    print(uId);
    print(uPassword);
  }

  Future<int> _deleteAccountAction(BuildContext context) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter_Semi/user_delete_flutter.jsp?uId=$uId&uPassword=$uPassword');
    await http.get(url);

    // print(uId);
    // print(uPassword);
    _disposeDeletedAccount();
    return 0;
  }

  // Desc: 회원탈퇴하면 정보 만료
  // 2022.12.28
  _disposeDeletedAccount() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    setState(() {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  Future close() async => handler.closeDB();
}
