import 'package:flutter/material.dart';
import 'package:mvvm/ui/checkbox.dart';
import 'package:mvvm/viewmodel/controller.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: Checkbox_example(),
      ),
    );
  }
}
