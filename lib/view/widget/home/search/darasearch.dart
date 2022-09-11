import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';

class DataSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Get.theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Get.theme.backgroundColor),
          borderRadius: BorderRadius.circular(18),
        ),
        hintStyle: Get.theme.textTheme.subtitle1,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: Get.height * 0.1,
        foregroundColor: Get.theme.backgroundColor,
        backgroundColor: Get.theme.primaryColor,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query != '' ? query = '' : Get.back();
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.itemsController.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(controller.itemsController[index].itemsName.toString()),
        ),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      List filterNames = controller.itemsController
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
                      .goToItemDataPage(controller.itemsController[index]);
            },
            child: ListTile(
              title: query != ''
                  ? Text(
                      filterNames[index].itemsName.toString(),
                    )
                  : Text(
                      controller.itemsController[index].itemsName.toString(),
                    ),
              trailing: query != ''
                  ? Text(
                      '${filterNames[index].itemsPrice} \$',
                      style: Get.textTheme.subtitle1,
                    )
                  : Text(
                      '${controller.itemsController[index].itemsPrice} \$',
                      style: Get.textTheme.subtitle1,
                    ),
            ),
          ),
        ),
      );
    });
  }
}
