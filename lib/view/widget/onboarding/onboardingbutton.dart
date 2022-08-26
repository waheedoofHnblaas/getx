import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/onboardingcontoller.dart';
import 'package:getx/core/constant/colors.dart';

class OnBoardingButton extends GetView<OnBoardingController> {
  const OnBoardingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      padding:
      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      color: AppColors.primary,
      onPressed: () {
        controller.next();
      },
      child:  Text(
        'continue'.tr,
        style: const TextStyle(color: AppColors.back,fontFamily: 'Cairo'),
      ),
    );
  }
}
