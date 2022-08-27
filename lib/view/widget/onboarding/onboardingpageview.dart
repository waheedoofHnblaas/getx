import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/onboardingcontoller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/static.dart';

class OnBoardingPageView extends GetView<OnBoardingController> {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageView,
      onPageChanged: (value) {
        controller.change(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              onBoardingList[index].title!.tr,
              style: Get.theme.textTheme.headline1,
            ),
            Image.asset(
              onBoardingList[index].image!,
              fit: BoxFit.fill,
              height: 250,
              width: 220,
            ),
            Text(onBoardingList[index].body!.tr,
                style: Get.theme.textTheme.bodyText1,
                textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}
