import 'package:flutter/material.dart';
import 'package:flutter_semi_project_app/kakao_login.dart';
import 'package:flutter_semi_project_app/view/home.dart';
import 'package:flutter_semi_project_app/view/kakao_home.dart';
import 'package:flutter_semi_project_app/view/login.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '72521cc8e4985bcd55ef8ebc76d5e4fd',
    javaScriptAppKey: '992194aa167bda64ecd93b8ea05e1928',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Login(),
        '/kakao_home': (BuildContext context) => const KakaoHome(),
      },
    );
  }
}
