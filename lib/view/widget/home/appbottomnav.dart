import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/bottomnavcontroller.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class AppBottomNav extends GetView<HomeController> {
  AppBottomNav({Key? key}) : super(key: key);
  @override
  final HomeController controller = Get.put(HomeController());

  void _onTap(int i) {
    print('ScrollBottomNavigationBar $i');
    print('ScrollBottomNavigationBar ');
    controller.changePage(i);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollBottomNavigationBar(
      onTap: _onTap,
      controller: controller.scrollController,
      elevation: 0,
      iconSize: 21,
      backgroundColor: AppColors.back,
      selectedLabelStyle: const TextStyle(fontSize: 11),
      currentIndex: controller.currentPage.value,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedFontSize: 26,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: 'home'),
        // BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.money_dollar), label: 'orders'),
        BottomNavigationBarItem(
            activeIcon: null,
            icon: Icon(
              CupertinoIcons.person,
            ),
            label: 'person'),
      ],
    );
  }
}
