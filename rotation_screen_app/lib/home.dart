import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rotation_screen_app/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WidgetDart wd = WidgetDart();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      body: OrientationBuilder(
        builder: ((context, orientation) {
          if (orientation == Orientation.portrait) {
            return wd.portraitMode();
          } else {
            return wd.landscapeMode();
          }
        }),
      ),
    );
  }

  // Functions

  // 2022-12-21
  // portrait, landscape를 각각 stack 으로 쌓을 것임.
  // Widget portraitMode() {
  //   return Stack(
  //     children: const [
  //       Center(
  //         child: Text('Portrait Mode'),
  //       )
  //     ],
  //   );
  // }

  // Widget landscapeMode() {
  //   return Stack(
  //     children: const [
  //       Center(
  //         child: Text('Landscape Mode'),
  //       )
  //     ],
  //   );
  // }
} // End
