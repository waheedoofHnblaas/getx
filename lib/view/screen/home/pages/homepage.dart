import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/view/widget/home/appcardsummery.dart';
import 'package:getx/view/widget/home/appcategorieswidget.dart';
import 'package:getx/view/widget/home/appitemcardview.dart';
import 'package:getx/view/widget/home/appsearchwidget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        const AppSearchWidget(),
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 8,
            ),
            const AppCardSummery(),
            AppCategoriesWidget(),
            const SizedBox(
              height: 8,
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
