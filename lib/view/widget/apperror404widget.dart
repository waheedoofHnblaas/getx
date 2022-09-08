import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/imagesassets.dart';

class AppEroor404Widget extends StatelessWidget {
  AppEroor404Widget({Key? key}) : super(key: key);

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset(AppImagesAssets.error),
        Container(
          decoration:  BoxDecoration(
              color: Get.theme.shadowColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  controller.getHomeData();
                },
                icon: const Icon(Icons.refresh)),
          ),
        )
      ],
    );
  }
}
