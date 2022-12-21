import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  // ---------------------
  // 로그인 성공한 ID와 PW 받기
  final String id;
  final String pw;
  const SecondPage({super.key, required this.id, required this.pw});
  // ---------------------
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${widget.id}님 환영합니다.'),
        // <SecondPage> generic에서 상속받은 _SecondPageState는 위젯.@@@을 사용할 수 있다.
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/bitcoin.jpg'),
          radius: 100,
        ),
      ),
    );
  }
}
