import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/screen/home/pages/homepage.dart';

Future<bool> AlterExitApp() {
  Get.defaultDialog(
    backgroundColor: Get.theme.backgroundColor,
    content: const Text(''),
    title: '13'.tr,
    titlePadding: const EdgeInsets.only(top: 10),
    titleStyle: Get.textTheme.headline1!.copyWith(fontSize: 16),
    actions: [
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Get.theme.primaryColor,
        onPressed: () {
          exit(0);
        },
        child: Text(
          '14'.tr,
          style: Get.textTheme.headline1!
              .copyWith(fontSize: 16, color: Get.theme.backgroundColor),
        ),
      ),
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Get.theme.primaryColor,
        onPressed: () {
          Get.back();
        },
        child: Text(
          '15'.tr,
          style: Get.textTheme.headline1!
              .copyWith(fontSize: 16, color: Get.theme.backgroundColor),
        ),
      ),
    ],
  );

  return Future.value(true);
}

// ignore: non_constant_identifier_names
Future<bool> AlterExitApp2() {
  Get.toNamed(AppRoute.home);
  return Future.value(true);
}
