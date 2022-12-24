import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/login.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late AppLifecycleState _lastLifecycleState;
  late String userId;
  late String password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = '';
    password = '';
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ID와 Password 출력',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User ID: $userId',
            ),
            Text(
              'Password: $password',
            ),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: const Text(
                "Log Out",
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = (prefs.getString('p_userId'))!;
      password = (prefs.getString('p_password'))!;
    });
  }

  _logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    setState(() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => Login()),
        ),
      );
    });
  }
}
