import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/homepagelist.dart';

// ignore: must_be_immutable
class AppItemDataAppBar extends StatelessWidget {
  AppItemDataAppBar({Key? key, required this.itemName}) : super(key: key);

  String itemName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      actions: [],
      title: Text(
        itemName.toString(),
        style: Get.textTheme.headline1,
      ),
    );
  }
}
