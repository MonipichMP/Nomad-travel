import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';

class AppTheme {
  get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Roboto",
        primaryColor: AppColor.white,
        cardColor: AppColor.blackBackground,
        accentColor: AppColor.white,
        buttonColor: AppColor.orange,
        scaffoldBackgroundColor: AppColor.black,
        accentIconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: "Roboto",
        primaryColor: AppColor.black,
        cardColor: AppColor.white,
        accentColor: AppColor.white,
        buttonColor: AppColor.blue,
        scaffoldBackgroundColor: AppColor.white,
        accentIconTheme: IconThemeData(color: Colors.black),
      );
}
