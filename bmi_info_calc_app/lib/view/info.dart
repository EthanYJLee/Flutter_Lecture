import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('images/bmiscale.png'),
              Image.asset('images/bmi_image.jpeg'),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'Quetelet지수라고도 하는 체질량 지수(BMI)는 사람의 체중을 나타내는 표준화 된 방법입니다. 이는 사람의 체질량을 몸 높이의 제곱으로 나눔으로써 계산됩니다. 결과 값은 kg/m² 단위의 BMI입니다. 이 값이 얼마나 낮거나, 혹은 높은지에 따라 개인을 저체중, 정상 체중, 과체중 또는 비만으로 분류합니다.BMI 지수는 벨기에의 과학자이자 수학자인 Adolphe Quetelet에 의해 1830 년에서 1850 년 사이에 만들어졌습니다. 신체 건강을 평가하는 완전히 포괄적인 기준은 아니지만, 단순성으로 인해 널리 알려져 사용됩니다. 이 방법은 체질량 뿐 아니라 키도 고려하기 때문에 단순히 체질량만 측정하는 것보다 건강을 정확하게 보여줍니다. 1980년대 이래 BMI는 세계 보건기구(WHO)에서 국가 비만 통계를 계산하는 표준으로 사용되었습니다.'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
