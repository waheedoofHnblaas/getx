import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx/view/widget/home/appcardsummery.dart';
import 'package:getx/view/widget/home/appcategorieswidget.dart';
import 'package:getx/view/widget/home/appitemswidget.dart';
import 'package:getx/view/widget/home/appsearchwidget.dart';
import 'package:getx/view/widget/home/personalicon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Home',
            style: Get.theme.textTheme.headline1!.copyWith(fontSize: 18),
          ),
          PersonalIconButton(controller)
        ],
      )),
      body: GetBuilder<HomeController>(builder: (controller) {
        return HandelingView(
            statusRequest: controller.statusRequest!,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const AppSearchWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const AppCardSummery(),
                  const SizedBox(
                    height: 15,
                  ),
                  AppCategoriesWidget(controller),
                  AppItemsWidget(controller),
                ],
              ),
            ));
      }),
    );
  }
}
