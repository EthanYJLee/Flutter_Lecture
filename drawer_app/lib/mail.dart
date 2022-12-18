import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: const Text('Mail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu1.png'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu3.png'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: Text('보낸 편지함'),
              trailing: Icon(
                Icons.add,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: Text('받은 편지함'),
              trailing: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receive');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
