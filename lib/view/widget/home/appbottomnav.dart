import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';

class AppBottomNav extends GetView<HomeController> {
  AppBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller.scrollController,
      child: GetBuilder<HomeController>(builder: (controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          height: 58,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Get.theme.primaryColor, width: 0.5),
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
              onTap: (value) => controller.onTap(value),
              // controller: controller.scrollController,
              elevation: 0,
              iconSize: 21,
              backgroundColor: Get.theme.backgroundColor,
              selectedLabelStyle: const TextStyle(fontSize: 11),
              currentIndex: controller.currentPage,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              selectedFontSize: 26,
              selectedItemColor:Get.theme.primaryColor,
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
      }),
    );
  }
}
