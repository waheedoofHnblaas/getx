import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/themes.dart';
import 'package:getx/view/widget/home/personalicon.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: GetBuilder<ThemeController>(builder: (controller) {
          return Text(
            'Home',
            textAlign: TextAlign.center,
            style: AppThemes().getCurrentTheme().textTheme.headline1,
          );
        }),
      ),
    );
  }
}
