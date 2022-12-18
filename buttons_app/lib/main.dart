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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('text button'); // dart 언어 (;)
              },
              onLongPress: () {
                print('long text button');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Elevated Button');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // 0~20
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'Outlined Button',
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // ---
              },
              icon: const Icon(
                Icons.home,
                size: 15,
                color: Colors.white,
              ),
              label: const Text('Go to Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize:
                    const Size(150, 50), // 숫자를 변수로 만들어서 쓰면 const를 사용할 수 없음
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                // ---
              },
              icon: const Icon(
                Icons.home,
                size: 20,
                color: Colors.black,
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // ---
              },
              icon: const Icon(
                Icons.home,
                size: 15,
                color: Color.fromARGB(99, 112, 67, 101),
              ),
              label: const Text('Go to Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //---
                  },
                  child: const Text('TextButton'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ---
                  },
                  child: const Text('ElevatedButton'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
