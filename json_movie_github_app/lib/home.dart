import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:json_movie_github_app/detail.dart';
import 'package:json_movie_github_app/model/movie_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network JSON Test'),
      ),
      body: Center(
        // data가 왔는지 여부 확인 (삼항연산자)
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return cardBuilder(context, index);
                }),
              ),
      ),
    );
  }

  // --- Functions ---
  // 2021-12-21
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');

    //----------
    var response = await http.get(url);
    // get (실행) 후 response로 send 하는 것을 await (대기해라) until initState
    // print(response.body); // body = 내용
    //----------

    //----------json을 list에 넣기----------
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    // 주의: uft8로 decode 안에 body를 넣으면 인코딩 안 됨
    List result = dataConvertedJSON['results'];
    // value 추출하기 위한 key값 설정 (json file에서)
    setState(() {
      data.addAll(result);
    });
    //----------

    return true;
  }

  // -----------List data에 전달받은 json file을 화면에 보여주기----------
  Widget cardBuilder(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (() {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => Detail()),
              ),
            );
          });
        }),
        child: Card(
          color: index % 2 == 0
              ? const Color.fromARGB(255, 243, 162, 189)
              : const Color.fromARGB(255, 246, 238, 160),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    data[index]['image'],
                    height: 100,
                  ),
                  Text(
                    '           ${data[index]['title']}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----------
}
