import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:webview_app/youtube.dart';
import 'package:webview_app/google.dart';
import 'package:webview_app/main.dart';
import 'package:webview_app/naver.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  // 검색 기능
  late TextEditingController textEditingController = TextEditingController();

  late bool isLoading; // for indicator
  late String siteName; // site name
  // late int selectedfavorite;
  // late List<String> favorite;
  late TabController tabController;

  // 즐겨찾기 버튼, 추가된 리스트
  late bool addFavorite;
  late Icon star;
  late List<String> favoriteList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    siteName = 'www.naver.com';
    // selectedfavorite = 0;
    // favorite = [];
    // favorite.add('구글');
    // favorite.add('네이버');
    // favorite.add('다음');
    tabController = TabController(length: 3, vsync: this);
    addFavorite = false;
    star = Icon(Icons.star_outline);
    favoriteList = [];
    favoriteList.add('www.naver.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        toolbarHeight: 100,
        title: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 200,
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.url,
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        siteName = textEditingController.text;
                      });
                      _reloadSite();
                    },
                    child: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      addFavorite == false
                          ? _addToFavorite()
                          : _removeFromFavorite();
                      _reloadSite();
                    },
                    icon: star,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
          TabBarView(
            controller: tabController,
            children: [
              Naver(),
              Google(),
              Youtube(),
            ],
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<WebViewController>(
            future: _controller.future,
            builder: ((BuildContext context,
                AsyncSnapshot<WebViewController> controller) {
              if (controller.hasData) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed: () {
                          controller.data!.goBack();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.orangeAccent,
                        onPressed: () {
                          controller.data!.reload();
                        },
                        child: const Icon(Icons.turn_left_rounded),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          controller.data!.goForward();
                        },
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                );
              }
              return Stack();
            }),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(
          labelColor: Colors.blue,
          controller: tabController,
          tabs: [
            Tab(
              child: Column(
                children: [
                  Image.asset(
                    'images/naver.jpeg',
                    height: 25,
                  ),
                  const Text(
                    '네이버',
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Image.asset(
                    'images/google.png',
                    height: 25,
                  ),
                  const Text(
                    '구글',
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Image.asset(
                    'images/you.png',
                    height: 25,
                  ),
                  const Text(
                    '유튜브',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---

  // 2022-12-22
  // 사이트를 reload하는 함수
  _reloadSite() {
    _controller.future.then(
      (value) => value.loadUrl('https://$siteName'),
    );
  }

  // // 즐겨찾기
  // _showDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: ((context) {
  //         return AlertDialog(
  //           scrollable: true,
  //           title: const Text('즐겨찾기'),
  //           content: SizedBox(
  //             width: 100,
  //             height: 200,
  //             child: ListView(
  //               scrollDirection: Axis.vertical,
  //               children: [
  //                 Column(
  //                   children: [
  //                     DropdownButton<String>(
  //                       value: favorite[selectedfavorite],
  //                       items: favorite
  //                           .map<DropdownMenuItem<String>>((String value) {
  //                         return DropdownMenuItem<String>(
  //                           value: value,
  //                           child: Text(value),
  //                         );
  //                       }).toList(),
  //                       onChanged: ((value) {
  //                         setState(() {
  //                           favorite[selectedfavorite] = value!;
  //                         });
  //                       }),
  //                       selectedItemBuilder: (context) {
  //                         return favorite.map(
  //                           (String value) {
  //                             return Text(
  //                               favorite[selectedfavorite],
  //                             );
  //                           },
  //                         ).toList();
  //                       },
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       }));
  // }
  _addToFavorite() {
    star = Icon(Icons.star);
    addFavorite = true;
  }

  _removeFromFavorite() {
    star = Icon(Icons.star_outline);
    addFavorite = false;
  }
}
