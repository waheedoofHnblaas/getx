import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';

class AppCardSummery extends StatelessWidget {
  AppCardSummery({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => controller.discountItemsModel.itemsDiscount !=
              '0'
          ? Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Get.theme.cardColor,
              ),
              child: InkWell(
                onTap: () {
                  controller.goToItemDataPage(controller.discountItemsModel);
                },
                child: Stack(
                  children: [
                    Positioned(
                      right: -60,
                      top: 10,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(100),
                          ),
                          color: Get.theme.hoverColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'A Summer Surprise',
                        style: Get.textTheme.bodyText1!.copyWith(
                            color: Get.theme.backgroundColor.withOpacity(0.9),
                            fontSize: 21),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cache back ${homeController.discountItemsModel.itemsDiscount}%',
                            style: Get.textTheme.headline1!.copyWith(
                                color: Get.theme.backgroundColor, fontSize: 28),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${homeController.discountItemsModel.itemsName}',
                                style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.backgroundColor,
                                    fontSize: 28),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${homeController.discountItemsModel.itemsPrice}\$',
                                style: Get.textTheme.bodyText1!.copyWith(
                                    color: Get.theme.backgroundColor,
                                    fontSize: 28),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
