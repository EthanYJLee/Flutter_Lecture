import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_list_app2/insert.dart';
import 'package:firebase_list_app2/student.dart';
import 'package:firebase_list_app2/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: const Text('Firestore List'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Insert()),
                ),
              );
            }),
            icon: const Icon(
              Icons.add_outlined,
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('students')
            .orderBy('code', descending: false)
            .snapshots(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = snapshot.data!.docs;

          return ListView(
            children: documents.map((e) => _buildItemWidget(e)).toList(),
          );
        }),
      ),
    );
  }
  // ----- Functions -----

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final student = Student(
        code: doc['code'],
        name: doc['name'],
        dept: doc['dept'],
        phone: doc['phone']);
    return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
        ),
        key: ValueKey(doc),
        onDismissed: (direction) {
          FirebaseFirestore.instance
              .collection('students')
              .doc(doc.id)
              .delete();
        },
        child: Container(
          color: Colors.amberAccent,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Update()),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                  '학번 : ${student.code} \n이름 : ${student.name}\n학과 : ${student.dept}\n전화번호 : ${student.phone}',
                ),
              ),
            ),
          ),
        ));
  }
}
