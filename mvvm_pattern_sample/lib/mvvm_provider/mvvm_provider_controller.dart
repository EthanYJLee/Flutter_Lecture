import 'package:flutter/material.dart';
import 'package:mvvm_pattern_sample/model/model.dart';

class MVVMProviderController extends ChangeNotifier {
  late Model _model;
  MVVMProviderController() {
    _model = Model();
  }
  int get count => _model.counter;

  void update() {
    notifyListeners();
    // (=controller.sink.add(_model);)
  }

  void incrementCounter() {
    _model.incrementCounter();
    update();
  }

  void decrementCounter() {
    _model.decrementCounter();
    update();
  }
}
