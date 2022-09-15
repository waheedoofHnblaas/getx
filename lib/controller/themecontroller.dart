import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
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

  void toggleDarkMode(BuildContext context) {
    isDarkMode = !isDarkMode;

    if (isDarkMode) {
      ThemeSwitcher.of(context).changeTheme(
        theme: AppThemes().getDarkTheme(), isReversed: false, // default: false
      );
      Get.changeThemeMode(ThemeMode.dark);
      myServices.sharedPreferences.setString('themeData', 'dark');
    } else {
      ThemeSwitcher.of(context).changeTheme(
        theme: AppThemes().getTheme(), isReversed: true, // default: false
      );
      Get.changeThemeMode(ThemeMode.light);
      myServices.sharedPreferences.setString('themeData', 'light');
    }

    update();
  }
}
