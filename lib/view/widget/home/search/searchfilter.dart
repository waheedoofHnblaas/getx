import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';

// ignore: must_be_immutable
class SearchFilter extends StatelessWidget {
  SearchFilter({Key? key, required this.query}) : super(key: key);
  String query;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      List filterNames = controller.itemsList
          .where((element) => element.itemsName!.toLowerCase().trim().contains(
                query.toLowerCase().trim(),
              ))
          .toList();

      return Container(
        color: Get.theme.primaryColor,
        height: double.maxFinite,
        child: ListView.builder(
          itemCount: filterNames.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              query != ''
                  ? controller.goToItemDataPage(filterNames[index])
                  : controller
                      .goToItemDataPage(controller.itemsList[index]);
            },
            child: ListTile(
              title: query != ''
                  ? Text(
                      filterNames[index].itemsName.toString(),
                    )
                  : Text(
                      controller.itemsList[index].itemsName.toString(),
                    ),
              trailing: query != ''
                  ? Text(
                      '${filterNames[index].itemsPrice} \$',
                      style: Get.textTheme.subtitle1,
                    )
                  : Text(
                      '${controller.itemsList[index].itemsPrice} \$',
                      style: Get.textTheme.subtitle1,
                    ),
            ),
          ),
        ),
      );
    });
  }
}
