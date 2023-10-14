import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:mytasks/controller/animations_notifier.dart';

class AppColor extends ChangeNotifier {
  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color black = Color(0xff000000);
  /////////////////////////////////////////////
  static const Color backgroundcolor = Color.fromARGB(255, 248, 248, 253);
  static const Color primaryColor = Color.fromARGB(255, 59, 168, 77);
  // static const Color primaryColor = Color.fromARGB(255, 110, 39, 176);

  //  Color.fromARGB(255, 71, 68, 114);
  // Color.fromARGB(255, 60, 12, 231);
  static const Color secondColor = Color.fromARGB(255, 43, 83, 192);
  static const Color thirdColor = Color.fromARGB(255, 170, 193, 255);
  static const Color fourthColor = Color.fromARGB(255, 38, 47, 175);
  static const Color fifthColor = Color.fromARGB(255, 0, 141, 35);

  // ////////////////////////////////////////////////////////////////
  // static Color gradientDeepBlue1 = const Color.fromARGB(255, 110, 39, 176);
  // static Color gradientDeepBlue2 = const Color.fromARGB(255, 191, 158, 221);
  static Color gradientDeepBlue1 = const Color.fromARGB(255, 72, 199, 72);
  static Color gradientDeepBlue2 = const Color.fromARGB(255, 158, 221, 158);
  static List<Color> generateGradient(int numberOfColors) {
    final List<Color> gradientColors = [];
    for (int i = 0; i < numberOfColors; i++) {
      final double ratio = i / (numberOfColors - 1);
      final int r =
          ((1 - ratio) * gradientDeepBlue1.red + ratio * gradientDeepBlue2.red)
              .round();
      final int g = ((1 - ratio) * gradientDeepBlue1.green +
              ratio * gradientDeepBlue2.green)
          .round();
      final int b = ((1 - ratio) * gradientDeepBlue1.blue +
              ratio * gradientDeepBlue2.blue)
          .round();
      gradientColors.add(Color.fromARGB(255, r, g, b));
    }
    // print("gradientColors:- $gradientColors");
    return gradientColors;
  }

// example for output
  static List<Color> get generateGradientreversed =>
      generateGradient(20).reversed.toList();
  // static List<Color> generateGradient = [
  //   const Color(0xff6e27b0),
  //   const Color(0xff722db2),
  //   const Color(0xff7734b5),
  //   const Color(0xff7b3ab7),
  //   const Color(0xff7f40b9),
  //   const Color(0xff8346bc),
  //   const Color(0xff884dbe),
  //   const Color(0xff8c53c1),
  //   const Color(0xff9059c3),
  //   const Color(0xff945fc5),
  //   const Color(0xff9966c8),
  //   const Color(0xff9d6cca),
  //   const Color(0xffa172cc),
  //   const Color(0xffa578cf),
  //   const Color(0xffaa7fd1),
  //   const Color(0xffae85d4),
  //   const Color(0xffb28bd6),
  //   const Color(0xffb691d8),
  //   const Color(0xffbb98db),
  //   const Color(0xffbf9edd)
  // ];
  // ////////////////////////////////////////////////////////////////
  double _x = 0.5;
  double _y = 0.5;
  Alignment get alignment => Alignment(_x, _y);
  void toggleRandomValues() {
    final random = Random();
    _x = (random.nextDouble() * 2.0) - 1.0; // Random value between -1 and 1
    _y = (random.nextDouble() * 2.0) - 1.0; // Random value between -1 and 1
  }

  void startAnimation() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      toggleRandomValues();
      notifyListeners();
    });
  }

  // ////////////////////////////////////////////////////////////////
  bool state = true;
  final Alignment _alignment2 = Alignment.center;
  Alignment get alignment2 => _alignment2;
  // final random = Random();
  void toggleRandomValues2() {
    // state = random.nextBool();
    // state == true
    //     ? _alignment2 = Alignment.topRight
    //     : _alignment2 = Alignment.bottomLeft;
    state = !state;
    notifyListeners();
  }

  void startAnimation2() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      toggleRandomValues2();
    });
  }
}
