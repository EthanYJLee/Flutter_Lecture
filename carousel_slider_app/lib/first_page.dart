import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:select_card/select_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late List<String> mapList;
  late List<String> mapListResult;
  late int selectedMap;
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
    selectedMap = 0;
    mapListResult = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '일일 퀘스트',
              style: TextStyle(fontSize: 20),
            ),
            CarouselSlider.builder(
              itemCount: mapList.length,
              itemBuilder: ((context, index, realIndex) {
                return Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectSingleCard(
                        context,
                        title: '',
                        cardSelectedColor: Colors.blue,
                        radius: 10,
                        onTap: (title, index) {
                          debugPrint(title);
                          debugPrint(index);
                          setState(() {});
                        },
                        image: mapList[index],
                      ),
                    ],
                  ),
                );
              }),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.2,
                enableInfiniteScroll: false,
                initialPage: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
