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
    orderDataController controller = Get.find();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Get.theme.primaryColor),
        color: Get.theme.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
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
          GetBuilder<orderDataController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                controller.getCount(itemsModel).toString(),
                style: Get.textTheme.headline1,
              ),
            );
          }),
          Padding(
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
        ],
      ),
    );
  }
}
