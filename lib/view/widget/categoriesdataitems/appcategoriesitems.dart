import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';
import 'package:getx/view/widget/itemsData/appitemcard.dart';

class AppCategoriesItems extends StatelessWidget {
  AppCategoriesItems({Key? key}) : super(key: key);
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.categoriesOfItemsList.isEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
            ),
            Icon(
              Icons.hourglass_empty_outlined,
              color: Get.theme.primaryColor,
              size: 44,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Empty',
              style: Get.textTheme.bodyText2,
            ),
          ],
        ),
      );
    } else {
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
              items: controller.categoriesOfItemsList,
            );
          },
          childCount: controller.categoriesOfItemsList.length,
        ),
      );
    }
  }
}
