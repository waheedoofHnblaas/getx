import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/view/widget/language/buttonlanguage.dart';

class LanguagePage extends GetView<MyLocalController> {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('choose language'.tr,style: Get.theme.textTheme.headline1,),
            const SizedBox(height: 22,),
            LanguageButton(buttontext: 'العربية',onPressed:  (){
              controller.changeLang('ar');
              Get.toNamed(AppRoute.onboarding);
            }),
            const SizedBox(height: 11,),
            LanguageButton(buttontext: 'English',onPressed:  (){
              controller.changeLang('en');
              Get.toNamed(AppRoute.onboarding);
            }),

          ],
        ),
      ),
    );
  }
}
