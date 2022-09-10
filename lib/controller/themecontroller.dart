import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/themes.dart';
import 'package:getx/core/services/services.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    if (myServices.sharedPreferences.getString('themeData') == 'dark') {
      isDarkMode = true;
    } else {
      isDarkMode = false;
    }
    update();
    super.onInit();
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(AppThemes().getDarkTheme());
      Get.changeThemeMode(ThemeMode.dark);
      myServices.sharedPreferences.setString('themeData', 'dark');
    } else {
      Get.changeTheme(AppThemes().getTheme());
      Get.changeThemeMode(ThemeMode.light);
      myServices.sharedPreferences.setString('themeData', 'light');
    }
  
    update();
  }
}
