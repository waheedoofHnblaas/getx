import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx/controller/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/links.dart';

class AppItemsWidget extends StatelessWidget {
  const AppItemsWidget(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primary,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width * 0.40,
                  height: Get.height * 0.28,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14),
                    ),
                    child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.colorBurn),
                          ),
                        ),
                      ),
                      fit: BoxFit.fill,
                      imageUrl: '${controller.items[index]['items_image']}',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(
                        margin: const EdgeInsets.all(20),
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: AppColors.second,
                            backgroundColor: AppColors.primary),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  controller.items[index]['items_name'],
                  style: Get.textTheme.subtitle1!.copyWith(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
