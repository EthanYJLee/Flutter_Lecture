import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// 여러 페이지를 감시 관리하는 개념 observer (memory에 상주)
class _LoginState extends State<Login> with WidgetsBindingObserver {
  // ***
  late AppLifecycleState _lastLifecycleState; //** lifecycle을 관리해줌 */
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // *** add observer ***
    WidgetsBinding.instance.addObserver(this);
    _initSharedPreferences(); // *** SharedPreferences 초기화 ***

    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //**
  //앱 활성 된 상태에서 back 키를 눌러 앱을 종료하면 inactive > paused > detached
  //순으로 발생되는 것을 볼 수 있다. 앱이 종료된 상태라고 보면 됨.
  //안드로이드 Native와는 다르게 앱이 실행될때는 onResume 이벤트가 발생하지 않는다.
  //*/
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    switch (state) {

      //** detached */
      case AppLifecycleState.detached:
        // 응용 프로그램은 여전히 flutter 엔진에서 호스팅되지만 "호스트 View"에서 분리됩니다.
        // 앱이 이 상태에 있으면 엔진이 "View" 없이 실행됩니다.
        // 엔진이 처음 초기화 될 때 "View" 연결 진행 중이거나 네비게이터 팝으로 인해 "View"가 파괴된 후 일 수 있습니다.
        print('detached');
        break;

      //** resumed */
      case AppLifecycleState.resumed:
        // 앱이 표시되고 사용자 입력에 응답합니다.
        // 주의! 최초 앱 실행때는 해당 이벤트가 발생하지 않습니다.
        print('resume');
        break;

      //** inactive */
      case AppLifecycleState.inactive:
        // 앱이 비활성화 상태이고 사용자의 입력을 받지 않습니다.
        // ios에서는 포 그라운드 비활성 상태에서 실행되는 앱 또는 Flutter 호스트 뷰에 해당합니다.
        // 안드로이드에서는 화면 분할 앱, 전화 통화, PIP 앱, 시스템 대화 상자 또는 다른 창과 같은 다른 활동이 집중되면 앱이 이 상태로 전환됩니다.
        // inactive가 발생되고 얼마후 paused가 발생합니다.
        _disposeSharedPreferences();
        print('inactive');
        break;

      //** paused */
      case AppLifecycleState.paused:
        // 앱이 현재 사용자에게 보이지 않고, 사용자의 입력을 받지 않으며, 백그라운드에서 동작 중입니다.
        // 안드로이드의 onPause()와 동일합니다.
        // 응용 프로그램이 이 상태에 있으면 엔진은 Window.onBeginFrame 및 Window.onDrawFrame 콜백을 호출하지 않습니다.
        print('paused');
        break;
    }
    _lastLifecycleState = state;
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/login.png',
                height: 120,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    hintText: '사용자 ID',
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (userIdController.text.trim().isNotEmpty &&
                      passwordController.text.trim().isNotEmpty) {
                    _showDialog(context);
                  } else {
                    _showSnackbar(context);
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

  // ----- Functions -----
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('p_userId') ?? "");
      passwordController.text = (prefs.getString('p_password') ?? "");
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('환영합니다'),
            content: const Text('신분이 확인되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveSharedPreferences(); //** 로그인 성공시 SharedPreferences에 저장 */
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return const SecondPage();
                      }),
                    ),
                  );
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  }

  _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '사용자 ID와 암호를 입력하세요',
        ),
        duration: Duration(
          seconds: 1,
        ),
      ),
    );
  }

  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userId', userIdController.text);
    pref.setString('p_password', passwordController.text);
  }

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    //** 해당 key만 삭제
    //pref.remove('p_userId');
    //pref.remove('p_password');
    // */
    pref.clear();
  }

  // Inactivate Back Button after log out
  Future<bool> _willPopScope() async {
    return false;
  }
}
