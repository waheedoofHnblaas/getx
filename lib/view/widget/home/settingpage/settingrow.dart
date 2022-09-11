import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/themesdata/themes.dart';

class SettingRowWidget extends StatelessWidget {
  const SettingRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PersonController personController = Get.find();
    HomeController homeController = Get.find();
    ThemeController themeController = Get.find();
    return Row(
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
        ThemeSwitcher(
          builder: (context) => IconButton(
            tooltip: 'theme',
            onPressed: () {
              themeController.toggleDarkMode(context);
            },
            icon: Icon(
              Icons.sunny,
              color: AppThemes().getCurrentTheme().primaryColor,
              size: 33,
            ),
          ),
        ),
      ],
    );
  }
}
