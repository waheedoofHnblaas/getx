import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/onboardingcontoller.dart';
import 'package:getx/core/constant/colors.dart';

class AppSignUpAndLoginButton extends GetView<OnBoardingController> {
  const AppSignUpAndLoginButton( {required this.text,required this.onPressed,Key? key}) : super(key: key);

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        padding:
        const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        color: AppColors.primary,
        onPressed: onPressed,
        child:   Text(
          text,
          style:const TextStyle(color: AppColors.back,fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}