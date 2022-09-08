import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
     SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    systemNavigationBarColor:  Get.theme.backgroundColor, // navigation bar color
    statusBarColor: Colors.transparent, 
  ));
    sharedPreferences = await SharedPreferences.getInstance();
    print('==============init==============');
    return this;
  }
}

Future initServices() async {
  await Get.putAsync(() => MyServices().init());
}
