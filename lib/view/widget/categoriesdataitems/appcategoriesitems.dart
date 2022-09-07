import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';

class AppCategoriesItems extends StatelessWidget {
  AppCategoriesItems({Key? key}) : super(key: key);
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.categoriesItemsController.isEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
            ),
            const Icon(
              Icons.hourglass_empty_outlined,
              color: AppColors.primary,
              size: 44,
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Empty',style: Get.textTheme.bodyText2,),
          ],
        ),
      );
    } else {
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
                          imageUrl: controller
                              .categoriesItemsController[index].itemsImage!),
                    ),
                  ),
                  Text(
                    controller.categoriesItemsController[index].itemsName!,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.subtitle1!.copyWith(fontSize: 21),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${controller.categoriesItemsController[index].itemsPrice!} \$',
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
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '${controller.categoriesItemsController[index].itemsDiscount!}  %',
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
          childCount: controller.categoriesItemsController.length,
        ),
      );
    }
  }
}
