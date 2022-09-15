import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/view/widget/home/orderspage/basketitemdatacard.dart';

class YourOrdersPage extends StatelessWidget {
  YourOrdersPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Get.theme.primaryColor,
              ),
              color: Get.theme.shadowColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: GetBuilder<ItemDataController>(builder: (controller) {
                return Text('Cost = ${controller.getCost()}\$');
              }),
            ),
          ),
        ),
        Flexible(
          child: GetBuilder<ItemDataController>(
            builder: ((controller) {
              if (controller.getPasketItems().isEmpty) {
                return const Center(
                  child: Text('No Product Selected'),
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
      ],
    );
  }
}
