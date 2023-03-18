import 'package:flutter/material.dart';

class ViewModel with ChangeNotifier {
  bool value = false;
  TextEditingController textCont = TextEditingController();

  changeValue() {
    value = !value;
    notifyListeners();
  }

  dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: null,
          content: Text(
            textCont.text,
          ),
        );
      },
    );
  }
}
