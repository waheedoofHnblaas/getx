import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/core/localization/changelocal.dart';

import 'settingpage/rowtile.dart';

class SettingHomeWidget extends StatelessWidget {
  const SettingHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    MyLocalController localController = Get.find();

    HomeController homeController = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RowTileWidget(
          onTap: () {
            Get.toNamed(AppRoute.addItem);
          },
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
    );
  }
}
