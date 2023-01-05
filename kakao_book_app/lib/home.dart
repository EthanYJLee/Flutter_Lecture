import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KAKAO Book'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=알고리즘');
    var response = await http.get(url,
        headers: {"Authorization": "6528cb69494b90d54ec82c5c1f37e55e"});
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    String result = dataConvertedJSON["contents"];
    print(result);
    return result;
  }
}
