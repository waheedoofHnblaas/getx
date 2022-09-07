import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/model/item.dart';
import 'package:getx/view/widget/home/appbarhome.dart';

class ItemDataPage extends StatelessWidget {
  const ItemDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsModel itemsModel = Get.arguments['item'];
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.2,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          itemsModel.itemsName.toString(),
          style: Get.textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: Get.width - 20,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: itemsModel.itemsImage!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: AppColors.second,
                            backgroundColor: AppColors.primary),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 333),
                    decoration: const BoxDecoration(
                        color: AppColors.back,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_circle_down_outlined,
                            color: AppColors.primary,
                          )),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: const BoxDecoration(
                        color: AppColors.back,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(itemsModel.itemsPrice.toString() + ' \$'),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: const BoxDecoration(
                        color: AppColors.back,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                          '-' + itemsModel.itemsDiscount.toString() + ' %'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
