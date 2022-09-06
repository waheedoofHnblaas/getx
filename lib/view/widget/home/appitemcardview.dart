import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
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
                        imageUrl:
                            controller.itemsController[index].itemsImage!),
                  ),
                ),
                Text(
                  controller.itemsController[index].itemsName!,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.subtitle1!.copyWith(fontSize: 21),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${controller.itemsController[index].itemsPrice!} \$',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.subtitle1!.copyWith(fontSize: 11),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       const Icon(
                          Icons.arrow_circle_down_outlined,
                          color: Colors.greenAccent,
                          size: 13,
                        ),
                        const SizedBox(width: 3,),
                        Text(
                          '${controller.itemsController[index].itemsDiscount!}  %',
                          textAlign: TextAlign.center,
                          style:
                              Get.textTheme.subtitle1!.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        childCount: controller.itemsController.length,
      ),
    );
  }
}
