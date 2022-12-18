import 'package:drawer_app/home.dart';
import 'package:drawer_app/mail.dart';
import 'package:drawer_app/received_mail.dart';
import 'package:drawer_app/send_mail.dart';
import 'package:flutter/material.dart';

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
