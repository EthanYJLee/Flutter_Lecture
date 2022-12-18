import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/Mail.dart';
import 'package:navigator_appbar_ex_app/ReceivedMail.dart';
import 'package:navigator_appbar_ex_app/SendMail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Mail(),
        '/send': (context) => const SendMail(),
        '/receive': (context) => const ReceivedMail(),
      },
    );
  }
}
