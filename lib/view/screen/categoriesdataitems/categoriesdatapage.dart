import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/view/widget/home/search/appsearchwidget.dart';
import 'package:getx/view/widget/itemsData/appitemcard.dart';

class CategoriesDataPage extends StatelessWidget {
  CategoriesDataPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: homeController.categoriesController.length,
        itemBuilder: (context, index) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                centerTitle: true,
                title: Center(
                    child: Text(
                  homeController.categoriesController[index].categoriesId
                      .toString(),
                )),
              ),
              body: SafeArea(
                child: GetBuilder<HomeController>(
                  builder: (controller) => HandelingView(
                    statusRequest: controller.statusRequest!,
                    widget: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomScrollView(
                        slivers: [
                          AppSearchWidget(),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          SliverGrid(
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
                                  items: controller.itemsController,
                                );
                              },
                              childCount: controller.itemsController.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
