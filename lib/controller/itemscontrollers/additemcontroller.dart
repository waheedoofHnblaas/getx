import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/itemcurd/additem.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

abstract class additemControllerVM extends GetxController {
  add();

  getImagePath();
  changeCat(String index);
  bool isValied();
}

class AddItemController extends additemControllerVM {
  HomeController homeController = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final ImagePicker _picker = ImagePicker();

  final AddItemData addItemData = AddItemData(Get.find());
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController item_name;
  late TextEditingController items_cat;
  late TextEditingController items_name_ar;
  late TextEditingController items_desc;
  late TextEditingController items_desc_ar;
  late TextEditingController items_count;
  late TextEditingController items_active;
  late TextEditingController items_price;
  late TextEditingController items_discount;
  File? file;

  @override
  void onInit() {
    item_name = TextEditingController();
    items_active = TextEditingController(text: '1');
    items_cat = TextEditingController();
    items_desc = TextEditingController();
    items_desc_ar = TextEditingController();
    items_name_ar = TextEditingController();
    items_count = TextEditingController();
    items_discount = TextEditingController();
    items_price = TextEditingController();
    super.onInit();
  }



  @override
  Future getImagePath() async {
    final PickedFile? image = await _picker.getImage(
      source: ImageSource.gallery,
    );
    file = File(image?.path ?? file!.path);

    update();
    print(basename(file!.path));
  }

  @override
  add() async {
    if (formState.currentState!.validate() && isValied()) {
      statusRequest = StatusRequest.loading;
      update();
      print('add item : ${item_name.text}');

      var response = await addItemData.addItemData(
        item_name: item_name.text,
        items_cat: items_cat.text,
        items_name_ar: items_name_ar.text,
        items_desc: items_desc.text,
        items_desc_ar: items_desc_ar.text,
        items_count: items_count.text,
        items_active: items_active.text,
        items_price: items_price.text,
        items_discount: items_discount.text,
        file: file!,
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
            middleText: 'no item added',
            middleTextStyle: Get.textTheme.bodyText1,
            backgroundColor: Get.theme.backgroundColor,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not validate');
    }
  }

  @override
  bool isValied() {
    if (file.isNull ||
        item_name.text.isEmpty ||
        items_active.text.isEmpty ||
        items_cat.text.isEmpty ||
        items_desc.text.isEmpty ||
        items_desc_ar.text.isEmpty ||
        items_name_ar.text.isEmpty ||
        items_count.text.isEmpty ||
        items_discount.text.isEmpty ||
        items_price.text.isEmpty) {
      Get.bottomSheet(
        enableDrag: true,
        Container(
          decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(18))),
          height: Get.height * 0.12,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Center(child: Text('some values is Empty')),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  changeCat(String index) {

    items_cat =
        TextEditingController(text: index);
    update();
  }
}
