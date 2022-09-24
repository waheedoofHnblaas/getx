import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/itemcurd/deleteitem.dart';
import 'package:getx/data/model/item.dart';
import 'package:path/path.dart';

class DeleteItemController extends GetxController {
  late String item_id = '';
  late String item_imageName = '';
  StatusRequest statusRequest = StatusRequest.none;
  final DeleteItemData deleteItemData = DeleteItemData(Get.find());
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  HomeController homeController = Get.find();

  @override
  void onInit() {
    ItemsModel itemsModel = Get.arguments['item'];
    item_id = itemsModel.itemsId!;
    item_imageName = basename(itemsModel.itemsImage!);
    print(item_imageName);
    print(itemsModel.itemsImage!);
    print(item_id);
    print('===================');

    super.onInit();
  }

  delete() async {
    statusRequest = StatusRequest.loading;
    update();
    print('delete item of id = ${item_id}');

    var response = await deleteItemData.deleteItemData(
      item_id: item_id,
      item_imageName: item_imageName,
    );
    statusRequest = handlingData(response);
    print('$response------');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        homeController.changePage(0);
        Get.offAllNamed(AppRoute.home);
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no item deleted',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: Get.theme.backgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
