import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/links.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';
import 'package:getx/view/widget/home/appitemcardview.dart';

class AppItemsWidget extends StatelessWidget {
  const AppItemsWidget(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GridView.count(
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        children: List.generate(
          controller.items.length,
          (index) => AppItemCardView(controller: controller, index: index),
        ),
      ),
    );
  }
}
