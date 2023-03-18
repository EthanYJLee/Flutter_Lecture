import 'dart:async';

import 'package:mvvm_pattern_sample/model/model.dart';

class MvvmViewModel {
  late Model _model;
  // Stream = 방송국
  StreamController<Model> controller = StreamController<Model>();
  // 변경된 View의 내용을 감지하고 변경
  // (시청자 => 방송국 구독 (등록))
  Stream<Model> get mvvmStream => controller.stream;

  MvvmViewModel() {
    _model = Model();
  }
  //** 이 부분이 변경되지 않는 이상 View에는 문제가 생기지 않는다.
  int get count => _model.counter;
  void update() {
    controller.sink.add(_model);
  }
  // */

  void incrementCounter() {
    _model.incrementCounter();
    update();
  }

  void decrementCounter() {
    _model.decrementCounter();
    update();
  }
}
