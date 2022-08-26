import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String languagecode){
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString('lang', languagecode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? languagecode = myServices.sharedPreferences.getString('lang');
    if(languagecode=='ar'){
      language = const Locale('ar');
    }else if(languagecode=='en'){
      language = const Locale('en');
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}