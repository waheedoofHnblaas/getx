import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/view/widget/home/orderspage/basketitemdatacard.dart';
import 'package:getx/view/widget/home/orderspage/showcostwidget.dart';

class YourOrdersPage extends StatelessWidget {
  YourOrdersPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: GetBuilder<orderDataController>(
            builder: ((controller) {
              if (controller.getPasketItems().isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No Product Selected'),
                      const SizedBox(height: 20,),
                      GetBuilder<HomeController>(
                        builder: (controller) => Container(
                          decoration: BoxDecoration(
                            color: Get.theme.shadowColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: IconButton(
                              onPressed: () {
                                controller.changePage(0);

                              },
                              icon: Icon(
                                Icons.add,
                                color: Get.theme.primaryColor,
                              )),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.getPasketItems().length,
                  itemBuilder: (context, index) => BasketItemData(
                    controller: controller,
                    index: index,
                  ),
                );
              }
            }),
          ),
        ),
        const showCostWidget(),
      ],
    );
  }
}
