import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/core/constant/color.dart';
// import 'package:mytasks/core/services/services.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class AppThemes {
  static ThemeData stdTheme = ThemeData(
    // fontFamily: _getCurrentLang() == "en" ? "PlayfairDisplay" : "Cairo",
    primarySwatch: createMaterialColor(AppColor.primaryColor),
    primaryColor: AppColor.primaryColor,
    textTheme: TextTheme(
      displayMedium: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      bodySmall: TextStyle(
          height: 2.h,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundcolor,
      titleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: AppColor.primaryColor, size: 35),
      centerTitle: true,
      elevation: 0,
    ),
  );

  // static String? _getCurrentLang() {
  //   MyService myService = Get.find();
  //   return myService.pref.getString("lang");
  // }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
