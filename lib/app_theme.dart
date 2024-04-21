import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryColor = const Color(0xff39A552);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff303030);
  static Color greyColor = const Color(0xff79828B);
  static ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(splashFactory: NoSplash.splashFactory),
    appBarTheme: AppBarTheme(
      foregroundColor: whiteColor,
      centerTitle: true,
      color: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.w500),
    ),
  );
}
