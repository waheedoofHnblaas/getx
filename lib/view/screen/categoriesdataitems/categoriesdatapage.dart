import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/categoriesdataitems/appcategoriesitems.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/categoriesdataitems/appcategoriesitems.dart';
import 'package:getx/view/widget/home/appitemsgridcardview.dart';
import 'package:getx/view/widget/home/appsearchwidget.dart';

class CategoriesDataPage extends StatelessWidget {
  CategoriesDataPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
           },
          icon:const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          Get.arguments['categories_name'],
        ),
      ),
      body: SafeArea(
          child: GetBuilder<HomeController>(
        builder: (controller) => HandelingView(
            statusRequest: controller.statusRequest!,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                  slivers: [
                    const AppSearchWidget(),
                    AppCategoriesItems(),
                  ]),
            )),
      )),
    );
  }
}
