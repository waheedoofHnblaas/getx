import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppThemes {
  ThemeData getTheme() {
    return ThemeData(
      // canvasColor: Colors.transparent,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            fontSize: 24,
            color: AppColors.primary),
        bodyText1:
            TextStyle(height: 2, color: AppColors.gray, fontFamily: 'Cairo'),
        bodyText2: TextStyle(
          height: 2,
          color: AppColors.primary,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
        subtitle1:
            TextStyle(height: 2, color: AppColors.back, fontFamily: 'Cairo'),
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
          color: AppColors.primary,
        ),
        toolbarHeight: Get.height * 0.07,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        elevation: 0,
        backgroundColor: AppColors.back,
      ),
    );
  }
}
