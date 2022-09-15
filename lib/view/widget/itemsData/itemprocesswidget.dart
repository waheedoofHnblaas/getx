import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/data/model/item.dart';

class ItemProcessWidget extends StatelessWidget {
  ItemProcessWidget({Key? key, required this.itemsModel}) : super(key: key);
  ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    ItemDataController controller = Get.find();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Get.theme.shadowColor,
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: IconButton(
                onPressed: () {
                  controller.incItem(itemsModel);
                },
                icon: Icon(
                  Icons.add,
                  color: Get.theme.primaryColor,
                )),
          ),
        ),
        GetBuilder<ItemDataController>(builder: (controller) {
          return Container(
            decoration: BoxDecoration(
                color: Get.theme.shadowColor,
                borderRadius: const BorderRadius.all(Radius.circular(0))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                controller.getCount(itemsModel).toString(),
                style: Get.textTheme.headline1,
              ),
            ),
          );
        }),
        Container(
          decoration: BoxDecoration(
              color: Get.theme.shadowColor,
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: IconButton(
                onPressed: () {
                  controller.decItem(itemsModel);
                },
                icon: Icon(
                  Icons.remove,
                  color: Get.theme.primaryColor,
                )),
          ),
        ),
      ],
    );
  }
}
