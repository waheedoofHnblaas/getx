import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';

class AppItemCardView extends StatelessWidget {
  AppItemCardView({Key? key, required this.controller}) : super(key: key);

  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 190.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 260,
        crossAxisSpacing: 22.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primary,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 190,
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
                  style: Get.textTheme.subtitle1!.copyWith(fontSize: 21),
                ),
                Text(
                  controller.items[index]['items_price'] + ' \$',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.subtitle1!.copyWith(fontSize: 11),
                ),
              ],
            ),
          );
        },
        childCount: controller.items.length,
      ),
    );
  }
}
