import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/data/datasource/static/static.dart';

abstract class OnBoardingControllerGet extends GetxController {
  next();

  change(int i);
}

class OnBoardingController extends OnBoardingControllerGet {
  int currentPage = 0;

  PageController pageView = PageController();

  MyServices myservices = Get.find();




  @override
  change(int i) {
    currentPage = i;
    update();

  }

  @override
  next() {
    currentPage++;
    if(currentPage>=onBoardingList.length){
      myservices.sharedPreferences.setString('first', 'false');
      Get.offAllNamed(AppRoute.login);
    }else{
      pageView.animateToPage(currentPage,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }

  }

  @override
  void onInit() {}
}
