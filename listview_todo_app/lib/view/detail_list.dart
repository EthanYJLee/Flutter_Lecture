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
            Image.asset(Message.imagePath),
            Text(Message.workList),
            const SizedBox(
              height: 200,
            ),
            CalendarDatePicker(
              initialDate: DateTime(2022, 3, 1),
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2022, 12, 31),
              onDateChanged: (value) => DateTime.now,
            ),
            ElevatedButton(
              onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const TableList()),
                    ),
                  )),
              child: const Text(
                '목록으로',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
