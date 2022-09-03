import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';

class AppItemCardView extends StatelessWidget {
   AppItemCardView(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  HomeController controller;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(35),
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14),
              ),
              child: AppCachImage(
                  imageUrl: '${controller.items[index]['items_image']}'),
            ),
          ),
          Text(
            controller.items[index]['items_name'],
            textAlign: TextAlign.center,
            style: Get.textTheme.subtitle1!.copyWith(fontSize: 16),
          ),
          Text(
            controller.items[index]['items_price'] + ' \$',
            textAlign: TextAlign.center,
            style: Get.textTheme.subtitle1!.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
