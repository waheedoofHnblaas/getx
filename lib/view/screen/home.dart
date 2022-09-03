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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.only(top: 10),
        child: CustomScrollView(
          slivers: [
            AppBarHomeWidget(controller),
            const AppSearchWidget(),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 8,
                ),
                AppCardSummery(),
                AppCategoriesWidget(controller),


                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ]),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return AppItemCardView(controller: controller, index: index);
                },
                childCount: controller.items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// GetBuilder<HomeController>(builder: (controller) {
// return HandelingView(
// statusRequest: controller.statusRequest!,
// widget: SliverFixedExtentList(
// itemExtent: 4,
// delegate: SliverChildListDelegate([
// AppSearchWidget(),
// const AppCardSummery(),
// AppCategoriesWidget(controller),
// AppItemsWidget(controller),
// ]),
// ));
// })
