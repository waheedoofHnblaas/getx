import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/links.dart';

class AppCategoriesWidget extends StatelessWidget {
  AppCategoriesWidget({
    Key? key,
  }) : super(key: key);

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration:  BoxDecoration(
        color: Get.theme.shadowColor,
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      height: Get.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.getCategoriesItems(
                  controller.categoriesList[index].categoriesId!);
              controller.goToCategoriesPage(
                  controller.categoriesList[index].categoriesId!,
                  controller.categoriesList[index].categoriesName!);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Get.theme.primaryColor.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 33,
                      // width: 77,
                      backgroundColor: Get.theme.primaryColor.withOpacity(0.8),
                      child: SvgPicture.network(
                        '${AppLinks.imageLink}${controller.categoriesList[index].categoriesImage!}',
                        color: Get.theme.backgroundColor,
                        width: Get.width * 0.1,
                        height: Get.width * 0.1,
                      ),
                    ),
                  ),
                  Text(
                    controller.categoriesList[index].categoriesName!,
                    style: Get.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
