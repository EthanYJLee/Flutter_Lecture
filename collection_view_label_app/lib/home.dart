import 'package:collection_view_label_app/add_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> mapList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapList = [];
    mapList.add('images/1.png');
    mapList.add('images/2.png');
    mapList.add('images/3.png');
    mapList.add('images/4.png');
    mapList.add('images/5.png');
    mapList.add('images/6.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일퀘'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => AddHero()),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: GridView.builder(
          itemCount: mapList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black,
                child: Card(
                  color: Colors.amberAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        mapList[index],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
