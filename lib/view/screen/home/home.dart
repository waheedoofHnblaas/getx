import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/bottomnavcontroller.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/static.dart';
import 'package:getx/view/screen/home/homepage.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/home/appbottomnav.dart';
import 'package:getx/view/widget/home/appcardsummery.dart';
import 'package:getx/view/widget/home/appcategorieswidget.dart';
import 'package:getx/view/widget/home/appitemcardview.dart';
import 'package:getx/view/widget/home/appsearchwidget.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonController pcontroller = Get.find();
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<PersonController>(
          builder: (pcontroller) => AppBarHomeWidget(),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => HandelingView(
            statusRequest: controller.statusRequest!,
            widget: GetX<HomeController>(
              builder: (controller) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: PageList[controller.currentPage.value],
                );
              },
            )),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: AppBottomNav(),
      backgroundColor: AppColors.back,
    );
  }
}
