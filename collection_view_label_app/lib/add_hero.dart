import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddHero extends StatefulWidget {
  const AddHero({super.key});

  @override
  State<AddHero> createState() => _AddHeroState();
}

class _AddHeroState extends State<AddHero> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('목록 추가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  label: Text('사진을 추가하세요'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
