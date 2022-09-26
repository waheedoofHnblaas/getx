import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/itemscontrollers/additemcontroller.dart';

class ImageChooseWidget extends StatelessWidget {
  const ImageChooseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.find();
    AddItemController controller = Get.find();
    return GetBuilder<AddItemController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 22),
          decoration: BoxDecoration(
              color: Get.theme.shadowColor,
              borderRadius:
              const BorderRadius.all(Radius.circular(16))),

          child: Row(
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
        );
      }
    );
  }
}
