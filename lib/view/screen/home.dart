import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/home/appcardsummery.dart';
import 'package:getx/view/widget/home/appcategorieswidget.dart';
import 'package:getx/view/widget/home/appitemcardview.dart';
import 'package:getx/view/widget/home/appsearchwidget.dart';
import 'package:getx/view/widget/home/personalicon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
      appBar: AppBar(title:
      AppBarHomeWidget(controller),),
      backgroundColor: AppColors.back,
      body: HandelingView(
            statusRequest: controller.statusRequest!,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),

              child: CustomScrollView(
                slivers: [
                  const AppSearchWidget(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 8,
                      ),
                      const AppCardSummery(),
                      AppCategoriesWidget(controller),

                    ]),
                  ),
                  AppItemCardView(controller: controller),

                ],
              ),
            )),
      ),
    );
  }
}
