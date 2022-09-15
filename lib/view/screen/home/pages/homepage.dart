import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/view/widget/home/appcardsummery.dart';
import 'package:getx/view/widget/home/appcategorieswidget.dart';
import 'package:getx/view/widget/home/appitemsgridcardview.dart';
import 'package:getx/view/widget/home/search/appsearchwidget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.find();
  ItemDataController itemDataController =
      Get.put(ItemDataController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
         AppSearchWidget(),
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            AppCardSummery(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Categories',
              style: Get.textTheme.headline1,
            ),
            Container(
              height: 0.5,
              color: Get.theme.primaryColor,
            ),
            AppCategoriesWidget(),
            Text(
              'Products',
              style: Get.textTheme.headline1,
            ),
            Container(
              height: 0.5,
              color: Get.theme.primaryColor,
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
        AppItemCardView(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 70,
          ),
        )
      ],
    );
  }
}
