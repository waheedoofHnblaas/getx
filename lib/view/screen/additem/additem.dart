import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/additemcontoller/additemcontroller.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:lottie/lottie.dart';

import '../../widget/auth/applogintext.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: GetBuilder<AddItemController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Center(child: Lottie.asset(AppImagesAssets.loading));
        } else {
          return Center(
            child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      primary: true,
                      children: [
                        const AppLoginTitel(title: 'Add New Items'),
                        const SizedBox(
                          height: 5,
                        ),
                        const AppLoginSubTitle(
                          subtitle: 'New items for selling and buy',
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        AppTextField(
                          textFieldController: controller.item_name,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Name',
                          iconData: Icons.production_quantity_limits,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.item_name =
                                TextEditingController(text: val);
                            print(controller.item_name.text);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_name_ar,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Ar Name',
                          iconData: Icons.production_quantity_limits,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_name_ar =
                                TextEditingController(text: val);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_desc,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Desc',
                          iconData: Icons.description_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_desc =
                                TextEditingController(text: val);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_desc_ar,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Ar Desc',
                          iconData: Icons.description_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_desc_ar =
                                TextEditingController(text: val);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_count,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Count',
                          iconData: Icons.numbers,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_count =
                                TextEditingController(text: val);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_discount,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Discount',
                          iconData: Icons.discount_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_discount =
                                TextEditingController(text: val);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_price,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item Price',
                          iconData: Icons.price_change_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_price =
                                TextEditingController(text: val);
                            print(controller.items_price.text);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_cat,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item categories',
                          iconData: Icons.price_change_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_cat =
                                TextEditingController(text: val);
                            print(controller.items_cat.text);
                          },
                        ),
                        AppTextField(
                          textFieldController: controller.items_active,
                          validator: (val) {
                            return null;
                          },
                          type: 'Item active',
                          iconData: Icons.local_activity_outlined,
                          inputType: TextInputType.name,
                          onChanged: (val) {
                            controller.items_active =
                                TextEditingController(text: val);
                            print(controller.items_active.text);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.file.isNull
                                ? Container()
                                : SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.file(
                                        File(controller.file!.path))),
                            TextButton(
                                onPressed: () async {
                                  await controller.getImagePath();
                                },
                                child: const Text(
                                  'ADD IMAGE',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSignUpAndLoginButton(
                    text: 'ADD',
                    onPressed: () async {
                      await controller.add();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
