import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/onboardingcontoller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/onboardinglist.dart';
import 'package:getx/view/widget/onboarding/onboardingbutton.dart';
import 'package:getx/view/widget/onboarding/onboardingpageview.dart';
import 'package:getx/view/widget/onboarding/onboardingslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: OnBoardingPageView(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                     OnBoardingSlider(),
                     Spacer(
                      flex: 2,
                    ),
                    OnBoardingButton(),
                     Spacer(
                      flex: 1,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
