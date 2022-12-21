import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/main.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/view/table_list.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(Message.imagePath),
                SizedBox(
                  height: 39,
                ),
                Text(
                  Message.workList,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            CalendarDatePicker(
              initialDate: DateTime(2022, 3, 1),
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2022, 12, 31),
              onDateChanged: (value) => DateTime.now,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '목록으로',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('삭제'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
