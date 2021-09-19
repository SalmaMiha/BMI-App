import 'dart:math';
import 'package:flutter/cupertino.dart';

class Calculate {
  Calculate({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double bmi;

  String calculation() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi <= 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi > 18.5 && bmi <= 24.9) {
      return 'NORMAL';
    } else if (bmi > 24.9 && bmi <= 29.9) {
      return 'OVERWEIGHT';
    } else if (bmi > 29.9 && bmi <= 34.9) {
      return 'OBESE';
    } else if (bmi > 34.9) {
      return 'EXTREMELY OBESE';
    }
  }

  String suggestion() {
    if (bmi <= 18.5) {
      return 'Your BMI range is underweight. You should eat more.';
    } else if (bmi > 18.5 && bmi <= 24.9) {
      return 'Your BMI range is perfect. Keep it up.';
    } else if (bmi > 24.9 && bmi <= 29.9) {
      return 'Your BMI range is overweight. You should maintain a healthy diet.';
    } else if (bmi > 29.9 && bmi <= 34.9) {
      return 'Your BMI range is obese. You should exercise and maintain a healthy diet.';
    } else if (bmi > 34.9) {
      return 'Your BMI range is extremely obese. You should consult a doctor.';
    }
  }
}
