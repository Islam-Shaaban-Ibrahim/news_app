import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryColor = const Color(0xff39A552);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff303030);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.w500),
    ),
  );
}