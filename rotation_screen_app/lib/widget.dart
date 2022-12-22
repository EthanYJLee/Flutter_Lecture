import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WidgetDart {
  Widget portraitMode() {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Hello',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  StatefulWidget landscapeMode() {
    late bool onOff = false;
    late State state;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Flutter',
                  ),
                ),
                Switch(
                  value: onOff,
                  onChanged: (value) {
                    state.setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
