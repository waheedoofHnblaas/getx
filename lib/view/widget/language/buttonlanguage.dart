import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class LanguageButton extends StatelessWidget {
  LanguageButton({required this.onPressed, required this.buttontext});

  Function()? onPressed;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      color:Get.theme.primaryColor,
      child: Text(buttontext,style: Get.theme.textTheme.subtitle1,),
    );
  }
}
