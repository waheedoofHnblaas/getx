import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/view/widget/home/personalicon.dart';

class AppBarHomeWidget extends StatelessWidget {
   AppBarHomeWidget(this.controller);

  HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Home',
          style: Get.theme.textTheme.headline1!
              .copyWith(fontSize: 18),
        ),
        PersonalIconButton(controller)
      ],
    );
  }
}
