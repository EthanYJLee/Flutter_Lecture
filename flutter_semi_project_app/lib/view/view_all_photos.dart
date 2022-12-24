import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewAllPhotos extends StatefulWidget {
  const ViewAllPhotos({super.key});

  @override
  State<ViewAllPhotos> createState() => _ViewAllPhotosState();
}

class _ViewAllPhotosState extends State<ViewAllPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Photos',
        ),
        backgroundColor: Color.fromARGB(255, 138, 143, 239),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green[100],
              child: const Text("1"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green[200],
              child: const Text('2'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green[300],
              child: const Text('3'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green[400],
              child: const Text('4'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green[500],
              child: const Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}
