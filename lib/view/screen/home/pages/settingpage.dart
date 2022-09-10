import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/themes.dart';
import 'package:getx/view/widget/home/settingpage/settinginfowidget.dart';

class SettingPage extends GetView<ThemeController> {
  SettingPage({Key? key}) : super(key: key);

  PersonController personController = Get.find();
  HomeController homeController = Get.find();
  ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AppSettingInfoWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppThemes().getCurrentTheme().shadowColor,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      tooltip: 'logout',
                      onPressed: () async {
                        await homeController.logout();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: AppThemes().getCurrentTheme().primaryColor,
                        size: 33,
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                      tooltip: 'edit',
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppThemes().getCurrentTheme().primaryColor,
                        size: 33,
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                      tooltip: 'settings',
                      onPressed: () {
                        themeController.toggleDarkMode();
                      },
                      icon: Icon(
                        Icons.sunny,
                        color:AppThemes().getCurrentTheme().primaryColor,
                        size: 33,
                      )),
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
          ],
        ),
      );
    });
  }
}
