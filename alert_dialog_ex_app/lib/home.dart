import 'package:alert_dialog_ex_app/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Move to the 2nd page.',
          ),
        ),
      ),
    );
  }

  // -----Functions-----
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap the button
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('Page 이동'),
          content: Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: (context) => Secondpage(),
                ),
              ),
              child: Text('Page 이동'),
            ),
          ],
        );
      },
    );
  }
} // End
