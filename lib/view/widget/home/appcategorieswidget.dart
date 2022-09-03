import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/links.dart';

class AppCategoriesWidget extends StatelessWidget {
  const AppCategoriesWidget(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 33,
                    // width: 77,
                    backgroundColor: AppColors.second,
                    child: SvgPicture.network(
                      '${AppLinks.imageLink}${controller.categories[index]['categories_image']}',
                      color: AppColors.primary,
                      width: Get.width * 0.1,
                      height: Get.width * 0.1,
                    ),
                  ),
                ),
                Text(
                  controller.categories[index]['categories_name'],
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}