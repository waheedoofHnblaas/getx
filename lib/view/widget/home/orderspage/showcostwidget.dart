import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';

class showCostWidget extends StatelessWidget {
  const showCostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDataController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.1, right: 10, left: 10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Get.theme.primaryColor,
            ),
            color: Get.theme.shadowColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GetBuilder<ItemDataController>(builder: (controller) {
                return Text('Cost = ${controller.getCost()}\$');
              }),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                  color: Colors.green,
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.deleteAll();
                  },
                  icon: Icon(
                    Icons.delete_outlined,
                    color: Get.theme.primaryColor,
                  )),
            ],
          ),
        ),
      );
    });
  }
}
