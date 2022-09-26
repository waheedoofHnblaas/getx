import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';
import 'package:getx/view/widget/itemsData/appitemcard.dart';

class AppItemCardView extends StatelessWidget {
  AppItemCardView({Key? key}) : super(key: key);

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.itemsList.isNotEmpty) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 260,
          crossAxisSpacing: 22.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ItemCard(
              index: index,
              items: controller.itemsList,
            );
          },
          childCount: controller.itemsList.length,
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          child: Center(
            child: Text('No Items',
                style: TextStyle(color: Get.theme.primaryColor)),
          ),
        ),
      );
    }
  }
}
