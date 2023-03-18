import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:project_test/login.dart';
import 'package:get/route_manager.dart';

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
        primarySwatch: Colors.amber,
        primaryColorDark: Color.fromARGB(207, 203, 165, 132),
        primaryColorLight: Color.fromARGB(255, 203, 151, 104),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Login(),
        // '/kakao_home': (BuildContext context) => const KakaoHome(),
      },
    );
  }
}
