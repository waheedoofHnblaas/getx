import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/personcontroller.dart';

class PersonalIconButton extends StatelessWidget {
  PersonalIconButton();

  PersonController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.defaultDialog(
              title: 'personal data',
              content: Column(
                children: [
                  Text(controller.email,style: Get.textTheme.bodyText2,),
                  Text(controller.phone,style: Get.textTheme.bodyText2,),
                  Text(controller.name,style: Get.textTheme.bodyText2,),
                  Text(controller.createDate,style: Get.textTheme.bodyText2,),
                ],
              ));
        },
        icon: const Icon(Icons.notifications_none_rounded,size: 33,));
  }
}
