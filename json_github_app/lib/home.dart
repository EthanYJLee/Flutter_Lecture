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
        title: const Text('JSON'),
      ),
      body: Center(
        // data가 왔는지 여부 확인 (삼항연산자)
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
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
    var url = Uri.parse('https://zeushahn.github.io/Test/student2.json');

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
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Code : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index]['code'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Name : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index]['name'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dept : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index]['dept'],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Phone : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index]['phone'],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ----------
}
