// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

class Test extends ChangeNotifier {
  bool isMale = true;
  double HeightValue = 160;
  int WeightValue = 70;
  int AgeValue = 20;

  double bmiCalculation() {
    var HeightInMeter = HeightValue / 100;
    double bmi = WeightValue / pow(HeightInMeter, 2);
    return bmi;
  }

  Text BmiPrint(var Bmi) {
    double FinalBmi = Bmi;
    if (FinalBmi < 18.5) {
      return Text("Underweight",
          style: TextStyle(
            color: Color.fromARGB(255, 135, 177, 217),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ));
    } else if (FinalBmi >= 18.5 && FinalBmi <= 24.9) {
      return Text("Normal weight",
          style: TextStyle(
            color: Color.fromARGB(255, 61, 211, 101),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ));
    } else if (FinalBmi >= 25 && FinalBmi <= 29.9) {
      return Text("Overweight",
          style: TextStyle(
            color: Color.fromARGB(255, 225, 213, 48),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ));
    } else if (FinalBmi >= 30 && FinalBmi <= 35) {
      return Text("Obesity",
          style: TextStyle(
            color: Color.fromARGB(255, 253, 128, 46),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ));
    } else {
      return Text("Extremely Obesity",
          style: TextStyle(
            color: Color.fromARGB(255, 249, 83, 83),
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ));
    }
  }

  Color BmiColor(var bmi) {
    if (bmi < 18.5) {
      return Color.fromARGB(255, 135, 177, 217);
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Color.fromARGB(255, 61, 211, 101);
    } else if (bmi >= 25 && bmi <= 29.9) {
      return Color.fromARGB(255, 225, 213, 48);
    } else if (bmi >= 30 && bmi <= 35) {
      return Color.fromARGB(255, 253, 128, 46);
    } else {
      return Color.fromARGB(255, 249, 83, 83);
    }
  }
double minWeight(){
      var HeightInMeter = HeightValue / 100;
  var minWeight = pow(HeightInMeter, 2)*18.5;
  return minWeight;
}
double maxWeight(){
      var HeightInMeter = HeightValue / 100;
  var maxWeight = pow(HeightInMeter, 2)*25.0;
  return maxWeight;
}
  Text DataPrint(String key, String data) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: key,
        style: const TextStyle(
            fontWeight: FontWeight.w700, color: Colors.white, fontSize: 29),
      ),
      TextSpan(
        text: data,
        style: const TextStyle(
            fontWeight: FontWeight.w900, color: Colors.black, fontSize: 29),
      ),
    ]));
  }
}
