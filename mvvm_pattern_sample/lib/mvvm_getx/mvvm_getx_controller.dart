import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvvm_pattern_sample/model/model.dart';

class MVVMGetxController extends GetxController {
  late Model model;
  RxInt count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    model = Model();
  }

  void incrementCounter() {
    model.incrementCounter();
    count(model.counter);
  }

  void decrementCounter() {
    model.decrementCounter();
    count(model.counter);
  }
}
