import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/themecontroller.dart';


class AppColors {
  static Color gray =
      Get.isPlatformDarkMode ? Color(0xFFD4D3D3) : const Color(0xff515151);
  static Color black = Get.isDarkMode ? Color(0xFFFFFFFF) : Colors.black;
  static Color back =
      Get.testMode ? Color(0xFF533F3F) : const Color(0xffffc5c5);
  static Color primary =
      Get.isPlatformDarkMode ? Color(0xFFF7BCBC) : const Color(0xff91023d);
  static Color primaryShadow =
      Get.isPlatformDarkMode ? Color(0x3DFAA6C9) : const Color(0x2291023d);
  static Color second = Get.isPlatformDarkMode
      ? const Color(0xfff8d9d9)
      : const Color(0xfff8d9d9);
  static Color card =
      Get.isPlatformDarkMode ? Color(0xFFEE7CAB) : const Color(0xff91023d);
  //static const Color card = Colors.pinkAccent;
  static Color secondCard =
      Get.isPlatformDarkMode ? Color(0xACBBBBFF) : const Color(0xae020244);
  //static const Color secondCard = Color(0xFFEA3C4B);
}