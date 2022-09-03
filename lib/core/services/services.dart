import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom, //This line is used for showing the bottom bar
    ]);
    sharedPreferences = await SharedPreferences.getInstance();
    print('==============init==============');
    return this;
  }
}

Future initServices() async {
  await Get.putAsync(() => MyServices().init());
}
