import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/data/model/item.dart';
import 'package:getx/view/screen/itemsdata/itemdata.dart';

class BasketItemData extends StatelessWidget {
  BasketItemData({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);
  ItemDataController controller;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDataPage(
          controller.getPasketItems().keys.toList()[index],
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: Get.theme.shadowColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      controller
                          .getPasketItems()
                          .keys
                          .toList()[index]
                          .itemsName
                          .toString(),
                      style: Get.textTheme.headline1,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '${controller.getPasketItems().keys.toList()[index].itemsPrice.toString()}'
                      ' \$',
                      style: Get.textTheme.bodyText2,
                    ),
                    SizedBox(
                      width: Get.width * 0.2,
                    ),
                    Text(
                      controller
                          .getPasketItems()
                          .values
                          .toList()[index]
                          .toString(),
                      style: Get.textTheme.headline1,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
