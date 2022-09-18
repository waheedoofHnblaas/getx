import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/function/alterexitapp.dart';
import 'package:getx/data/datasource/static/homepagelist.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/home/appbottomnav.dart';
import 'package:getx/view/widget/home/search/appsearchwidget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  PersonController personController =
      Get.put(PersonController(), permanent: true);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Scaffold(
      extendBody: true,
      appBar: AppBar(title: AppSearchWidget(),),
      body: WillPopScope(
        onWillPop: AlterExitApp,
        child: Column(
          children: [

            Flexible(
              child: GetBuilder<HomeController>(
                builder: (controller) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: HandelingView(
                      statusRequest: controller.statusRequest!,
                      widget: PageView(
                        //oooooooooooooooooooooooooo
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) =>
                            controller.onPageChanged(index),
                        controller: controller.pageController,
                        children: [
                          ...List.generate(PageList.length,
                              (index) => PageList[controller.currentPage]),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const AppBottomNav(),
    ));
  }
}
