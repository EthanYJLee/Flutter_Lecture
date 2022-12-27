import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewSelectedPhotos extends StatefulWidget {
  const ViewSelectedPhotos({super.key});

  @override
  State<ViewSelectedPhotos> createState() => _ViewSelectedPhotosState();
}

class _ViewSelectedPhotosState extends State<ViewSelectedPhotos>
    with WidgetsBindingObserver {
  late DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 선택한 날짜 표시
        title: const Text(
          'Selected Photos',
        ),
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                '$_dateTime'.substring(
                  0,
                  10,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              primary: true,
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
            const Divider(
              color: Colors.grey,
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print(_dateTime);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                    ),
                    child: const Text(
                      '메인화면으로',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----

  // Desc: 달력에서 선택한 날짜 전달받기 (SharedPreferences)
  // 2022.12.25
  _getSelectedDate() async {
    final prefs = await SharedPreferences.getInstance();
    _dateTime = DateTime.parse(prefs.getString('p_dateTimeString')!);
  }
}
