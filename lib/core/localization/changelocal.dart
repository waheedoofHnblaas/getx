import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/core/services/services.dart';

class MyLocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String languagecode) {
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString('lang', languagecode);
    language = Locale(languagecode);
    Get.updateLocale(locale);

    print(Get.locale);
    update();
  }

  switchLang() {
    // ignore: unrelated_type_equality_checks
    myServices.sharedPreferences.getString('lang') == 'ar'
        ? changeLang('en')
        : changeLang('ar');
  }

  @override
  void onInit() async {
    String? languagecode = myServices.sharedPreferences.getString('lang');
    if (languagecode == 'ar') {
      language = const Locale('ar');
    } else if (languagecode == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
