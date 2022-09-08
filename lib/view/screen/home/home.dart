import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/static.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/home/appbottomnav.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  PersonController personController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const AppBarHomeWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<HomeController>(
          builder: (controller) => HandelingView(
              statusRequest: controller.statusRequest!,
              widget: PageList[controller.currentPage]),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
