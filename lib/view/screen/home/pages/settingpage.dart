import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/view/widget/home/settingpage/settinginfowidget.dart';
import 'package:getx/view/widget/home/settingpage/settingrow.dart';
import 'package:path/path.dart';

class SettingPage extends GetView<ThemeController> {
  SettingPage({key}) : super(key: key);

  PersonController personController = Get.find();
  HomeController homeController = Get.find();
  ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const AppSettingInfoWidget(),
               const SettingRowWidget(),
              
              const SizedBox(
                width: 80,
              ),
            ],
          ),
        );
      },
    );
  }
}
