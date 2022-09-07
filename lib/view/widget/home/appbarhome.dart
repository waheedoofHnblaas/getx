import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/home/personalicon.dart';

class AppBarHomeWidget extends StatelessWidget {
  AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          'Home',
          textAlign: TextAlign.center,
          style: Get.textTheme.headline1!.copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
