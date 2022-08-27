import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

Future<bool> AlterExitApp() {
  Get.defaultDialog(
      content: const Text(''),
      title: '13'.tr,
      titlePadding: const EdgeInsets.only(top: 10),
      titleStyle: Get.textTheme.headline1!.copyWith(fontSize: 16),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.primary,
          onPressed: () {
            exit(0);
          },
          child: Text(
            '14'.tr,
            style: Get.textTheme.headline1!.copyWith(fontSize: 16,color: AppColors.back),
          ),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.primary,
          onPressed: () {
            Get.back();
          },
          child: Text(
            '15'.tr,
            style: Get.textTheme.headline1!.copyWith(fontSize: 16,color: AppColors.back),
          ),
        ),
      ],
      backgroundColor: AppColors.back);

  return Future.value(true);
}
