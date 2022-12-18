import 'package:bmi_info_calc_app/model/bmi_history.dart';
import 'package:bmi_info_calc_app/view/my_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

enum Sex { male, female }

class _CalcState extends State<Calc> {
  late double _currentHeight;
  late double _currentWeight;

  late List<String> _listSex;
  late String _dropdownSex;

  late double _heightStartRange;
  late double _heightEndRange;
  late double _weightStartRange;
  late double _weightEndRange;

  late double bmiResult;
  late String bmiResultStr;
  late String classify;
  late String result;

  late List<BMIHistory> bmiHistory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listSex = ['남성', '여성'];
    _dropdownSex = _listSex.first;
    _heightStartRange = 50;
    _heightEndRange = 200;
    _weightStartRange = 20;
    _weightEndRange = 150;
    _currentHeight = (_heightEndRange - _heightStartRange) / 2;
    _currentWeight = (_weightEndRange - _weightStartRange) / 2;
    bmiResult = 0;
    bmiResultStr = '';
    result = '';
    classify = '';

    bmiHistory = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            (result == '')
                ? showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('오류'),
                        content: Text('계산 기록이 없습니다.'),
                        actions: [
                          ElevatedButton(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    })
                : saveToHistory();
          });
        },
        label: Text('Add to Diary'),
        icon: Icon(Icons.add_outlined),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  '성별 : ',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: DropdownButton(
                    isExpanded: true,
                    value: _dropdownSex,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        _dropdownSex = value!;
                      });
                    },
                    items: _listSex
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '신장 (Height)',
                ),
                SizedBox(
                  width: 250,
                  child: Slider(
                    min: _heightStartRange,
                    max: _heightEndRange,
                    label: _currentHeight.toString(),
                    divisions: (_heightEndRange - _heightStartRange).round(),
                    value: _currentHeight,
                    onChanged: (double value) {
                      setState(() {
                        _currentHeight = value;
                      });
                    },
                  ),
                ),
                const Text('cm')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '체중 (Weight)',
                ),
                SizedBox(
                  width: 250,
                  child: Slider(
                    min: _weightStartRange,
                    max: _weightEndRange,
                    label: _currentWeight.toString(),
                    divisions: (_weightEndRange - _weightStartRange).round(),
                    value: _currentWeight,
                    onChanged: (double value) {
                      setState(() {
                        _currentWeight = value;
                      });
                    },
                  ),
                ),
                const Text('kg'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                calcBmi(context);
              },
              child: const Text('계산하기'),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Functions -----

  calcBmi(BuildContext context) {
    setState(() {
      bmiResult = (_currentWeight / (_currentHeight * _currentHeight / 10000));
      if (bmiResult < 20) {
        classify = '저체중';
      } else if (bmiResult < 24) {
        classify = '정상';
      } else if (bmiResult < 29) {
        classify = '과체중';
      } else {
        classify = '비만';
      }
      bmiResultStr = bmiResult.toStringAsFixed(2);
      result = 'BMI 측정결과 : 신체질량지수 (BMI) 는 $bmiResultStr 로 $classify 입니다.';
    });
  }

  saveToHistory() {
    BMIHistory.bmi = bmiResultStr;
    BMIHistory.bmiResult = classify;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => const MyHistory()),
      ),
    );
  }
}
