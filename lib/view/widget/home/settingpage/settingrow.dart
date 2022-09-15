import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/view/widget/home/settingpage/rowtile.dart';

class SettingRowWidget extends StatelessWidget {
  const SettingRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PersonController personController = Get.find();
    HomeController homeController = Get.find();
    ThemeController themeController = Get.find();
    MyLocalController localController = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppThemes().getCurrentTheme().shadowColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RowTileWidget(
            onTap: () {},
            icon: Icon(
              Icons.add,
              color: AppThemes().getCurrentTheme().primaryColor,
              size: 33,
            ),
            text: const Text('add product'),
          ),
          RowTileWidget(
            onTap: () {},
            icon: Icon(
              Icons.open_in_browser_rounded,
              color: AppThemes().getCurrentTheme().primaryColor,
              size: 33,
            ),
            text: const Text('my posts'),
          ),
          ThemeSwitcher(
            builder: (context) => RowTileWidget(
              onTap: () {
                print(Get.locale);

                localController.switchLang();
              },
              icon: Icon(
                Icons.language_outlined,
                color: AppThemes().getCurrentTheme().primaryColor,
                size: 33,
              ),
              text: const Text('change language'),
            ),
          ),
          ThemeSwitcher(
            builder: (context) => RowTileWidget(
              onTap: () {
                themeController.toggleDarkMode(context);
              },
              icon: Icon(
                Icons.sunny,
                color: AppThemes().getCurrentTheme().primaryColor,
                size: 33,
              ),
              text: const Text('change theme'),
            ),
          ),
          RowTileWidget(
            onTap: () {},
            icon: Icon(
              Icons.edit,
              color: AppThemes().getCurrentTheme().primaryColor,
              size: 33,
            ),
            text: const Text('edit account'),
          ),
          RowTileWidget(
            onTap: () async {
              await homeController.logout();
            },
            icon: Icon(
              Icons.power_settings_new_outlined,
              color: AppThemes().getCurrentTheme().primaryColor,
              size: 33,
            ),
            text: const Text('logout'),
          ),
        ],
      ),
    );
  }
}
