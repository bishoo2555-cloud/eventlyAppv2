import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.primaryLightColor,
      focusColor: AppColor.primaryLightbgColor,
      canvasColor: AppColor.primaryLightColor,
      cardColor: AppColor.primaryLightbgColor,
      shadowColor: AppColor.grayColor,
      splashColor: AppColor.whiteColor,
      hoverColor: AppColor.grayColor,
      indicatorColor: AppColor.DarkColor,
      scaffoldBackgroundColor: AppColor.primaryLightbgColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryLightColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryLightbgColor,
          unselectedItemColor: AppColor.primaryLightbgColor,
          selectedLabelStyle: AppStyle.bold12White,
          unselectedLabelStyle: AppStyle.bold12White),
      textTheme: TextTheme(
          headlineLarge: AppStyle.bold20Black,
          headlineMedium: AppStyle.bold20Primary,
          headlineSmall: AppStyle.reglur16White,
          titleSmall: AppStyle.bold14Primarylight,
          titleMedium: AppStyle.bold14Black,
          bodySmall: AppStyle.medium16Black,
          bodyMedium: AppStyle.medium16Gray));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.primaryDarkColor,
      focusColor: AppColor.primaryLightColor,
      canvasColor: AppColor.whiteColor,
      cardColor: AppColor.primaryDarkColor,
      shadowColor: AppColor.primaryLightColor,
      hoverColor: AppColor.whiteColor,
      splashColor: AppColor.blackColor,
      indicatorColor: AppColor.whiteColor,
      scaffoldBackgroundColor: AppColor.primaryDarkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryDarkColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryLightbgColor,
          unselectedItemColor: AppColor.primaryLightbgColor,
          selectedLabelStyle: AppStyle.bold12White,
          unselectedLabelStyle: AppStyle.bold12White),
      textTheme: TextTheme(
          headlineLarge: AppStyle.bold20White,
          headlineMedium: AppStyle.bold20Primary,
          headlineSmall: AppStyle.reglur16White,
          titleSmall: AppStyle.bold14Primarydark,
          titleMedium: AppStyle.bold14White,
          bodySmall: AppStyle.medium16White,
          bodyMedium: AppStyle.medium16White));
}
