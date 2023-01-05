import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_semi_project_app/view/add_photos.dart';
import 'package:flutter_semi_project_app/view/view_selected_photos.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with WidgetsBindingObserver {
  // 달력에서 선택한 날짜
  late DateTime selectedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selete Date',
        ),
        backgroundColor: const Color.fromARGB(255, 138, 143, 239),
        actions: [
          IconButton(
            onPressed: () {
              _saveSelectedDate();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((BuildContext context) => const AddPhotos()),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2000, 1, 1),
              lastDate: DateTime(2023, 12, 31),
              onDateChanged: ((value) {
                setState(() {
                  selectedDate = value;
                });
              }),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 138, 143, 239),
              ),
              onPressed: () {
                _saveSelectedDate();
                // print(selectedDate.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ViewSelectedPhotos()),
                  ),
                );
              },
              child: const Text(
                '앨범 보기',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----
  // Desc: 선택한 날짜 Shared Preferences에 String으로 save하고 넘겨주기
  // 2022.12.25
  _saveSelectedDate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('p_dateTimeString', selectedDate.toString());
  }
}
