import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search is clicked.');
            },
            icon: const Icon(
              Icons.mail_outline,
            ),
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
              title: Text('보낸 편지함'),
              leading: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              trailing: Icon(
                Icons.add,
              ),
            ),
            ListTile(
              title: Text('받은 편지함'),
              leading: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              trailing: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
