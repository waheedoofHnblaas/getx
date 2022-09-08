import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/onboardingcontoller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/static.dart';

class OnBoardingSlider extends StatelessWidget {
  const OnBoardingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                margin: const EdgeInsets.all(2),
                duration: const Duration(milliseconds: 400),
                width: controller.currentPage==index?20:6,
                height: 6,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ))
        ],
      );
    },);
  }
}
