import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/services/services.dart';

class AppThemes {
  ThemeData getCurrentTheme() {
    MyServices myServices = Get.find();
    return myServices.sharedPreferences.getString('themeData') == 'dark'
        ? AppThemes().getDarkTheme()
        : AppThemes().getTheme();
  }

  ThemeMode getCurrentThemeMode() {
    MyServices myServices = Get.find();
    return myServices.sharedPreferences.getString('themeData') == 'dark'
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xffffc5c5),
      //secondCard
      hoverColor: const Color(0xae020244),
      //colorSchemeSeed: const Color(0xae020244),
      //gray
      canvasColor: const Color(0xff515151),

      primaryColorDark: Colors.black,
      // canvasColor: Colors.transparent,
      //second
      secondaryHeaderColor: const Color(0xfff8d9d9),
      shadowColor: const Color(0x52CC7C9D),
      cardColor: const Color(0xff91023d),
      backgroundColor: const Color(0xffffc5c5),
      primaryColor: const Color(0xff91023d),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            fontSize: 24,
            color: Color(0xff91023d)),
        bodyText1:
            TextStyle(height: 2, color: Color(0xff515151), fontFamily: 'Cairo'),
        bodyText2: TextStyle(
          height: 2,
          color: Color(0xff91023d),
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
        // ignore: prefer_const_constructors
        subtitle1: TextStyle(
          height: 2,
          color: Color(0xffffc5c5),
          fontFamily: 'Cairo',
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
          fontSize: 16,
          color: Color(0xff91023d),
        ),
        toolbarHeight: Get.height * 0.07,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFFFC5C5),
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: const Color(0xFF533F3F),
      //secod card
      hoverColor: const Color(0xACBBBBFF),
      //colorSchemeSeed: const Color(0xACBBBBFF),
      //gray
      canvasColor: const Color(0xFFD4D3D3),

      primaryColorDark: const Color(0xFFFFFFFF),
      // canvasColor: Colors.transparent,
      secondaryHeaderColor: const Color(0xfff8d9d9),
      shadowColor: const Color(0x3DFAA6C9),
      cardColor: const Color(0xFFEE7CAB),
      backgroundColor: const Color(0xFF533F3F),
      primaryColor: const Color(0xFFFFE1E1),
      // canvasColor: Colors.transparent,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            fontSize: 24,
            color: Color(0xFFFFE1E1)),
        bodyText1:
            TextStyle(height: 2, color: Color(0xFFD4D3D3), fontFamily: 'Cairo'),
        bodyText2: TextStyle(
          height: 2,
          color: Color(0xFFFFE1E1),
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
        subtitle1:
            TextStyle(height: 2, color: Color(0xFF533F3F), fontFamily: 'Cairo'),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
          fontSize: 16,
          color: Color(0xFFFFE1E1),
        ),
        toolbarHeight: Get.height * 0.07,
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF533F3F),
      ),
    );
  }

  ThemeData searchAppBarTheme() {
    return Get.theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Get.theme.backgroundColor),
          borderRadius: BorderRadius.circular(18),
        ),
        hintStyle: Get.theme.textTheme.subtitle1,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: Get.height * 0.1,
        foregroundColor: Get.theme.backgroundColor,
        backgroundColor: Get.theme.primaryColor,
      ),
    );
  }
}
