import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/categoriescontroller.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/view/widget/home/search/appsearchwidget.dart';
import 'package:getx/view/widget/itemsData/appitemcard.dart';

class CategoriesDataPage extends StatelessWidget {
  CategoriesDataPage({Key? key}) : super(key: key);
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: AppSearchWidget(
            title: categoriesController.categoriesName,
            showback: true,
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                controller.categoriesOfItemsList.isNotEmpty
                    ? SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
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
                      )
                    : SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: Text(
                            'No Items',
                            style: TextStyle(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                      ),
                        )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
