import 'package:flutter/material.dart';
import 'package:nomad_travel/constants/colors.dart';

class AppTheme {
  get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Roboto",
        primaryColor: AppColor.black,
        accentColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.grey,
        accentIconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: "Roboto",
        primaryColor: AppColor.black,
        accentColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.blackBackground,
        accentIconTheme: IconThemeData(color: Colors.black),
      );
}
