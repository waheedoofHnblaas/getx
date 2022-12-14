import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/themesdata/themes.dart';

class AppBottomNav extends GetView<ThemeController> {
  const AppBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GetBuilder<HomeController>(builder: (controller) {
        return GetBuilder<ThemeController>(builder: (themeController) {
          return Container(
            height: 58,
            width: Get.width-10,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppThemes().getCurrentTheme().primaryColor,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(33),
                topLeft: Radius.circular(33),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(33),
                topLeft: Radius.circular(33),
              ),
              child: BottomNavigationBar(
                onTap: (value) => controller.changePage(value),
                // controller: controller.scrollController,
                elevation: 0,
                iconSize: 21,
                backgroundColor: AppThemes().getCurrentTheme().backgroundColor,
                selectedLabelStyle: const TextStyle(fontSize: 11),
                currentIndex: controller.currentPage,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                selectedFontSize: 26,
                selectedItemColor: AppThemes().getCurrentTheme().primaryColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                      ),
                      label: 'home'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.luggage_outlined),
                    label: 'your orders',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                      ),
                      label: 'settings'),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
