import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/data/datasource/static/homepagelist.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/home/appbottomnav.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  PersonController personController = Get.find();

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const AppBarHomeWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GetBuilder<HomeController>(
          builder: (controller) => HandelingView(
              statusRequest: controller.statusRequest!,
              widget: PageView(
                onPageChanged: (index) => controller.onPageChanged(index),
                controller: controller.pageController,
                children: [
                  ...List.generate(PageList.length, (index) => PageList[index]),
                ],
              )),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: AppBottomNav(),
    ));
  }
}
