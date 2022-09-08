import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/themes.dart';

class SettingPage extends GetView<ThemeController> {
  SettingPage({Key? key}) : super(key: key);

  PersonController personController = Get.find();
  HomeController homeController = Get.find();
  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Get.theme.shadowColor,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: 100,
                  color: Get.theme.primaryColor,
                ),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  personController.email!,
                  style: Get.theme.textTheme.bodyText2,
                ),
                Text(
                  personController.phone!,
                  style: Get.textTheme.bodyText2,
                ),
                Text(
                  personController.name!,
                  style: Get.textTheme.bodyText2,
                ),
                Text(
                  personController.createDate!,
                  style: Get.textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Get.theme.shadowColor,
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
                      color: Get.theme.primaryColor,
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
                      color: Get.theme.primaryColor,
                      size: 33,
                    )),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                    tooltip: 'settings',
                    onPressed: () {
                      themeController.toggleDarkMode();
                      print(themeController.isDarkMode);
                      print(Get.isDarkMode);

                      print(themeController.myServices.sharedPreferences
                          .getString('themeData'));
                    },
                    icon: Icon(
                      Icons.sunny,
                      color: Get.theme.primaryColor,
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
  }
}
