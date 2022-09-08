import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/model/item.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/itemsData/appitemdataappbar.dart';

class ItemDataPage extends StatelessWidget {
  const ItemDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsModel itemsModel = Get.arguments['item'];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        automaticallyImplyLeading: false,
        title: AppItemDataAppBar(itemName: itemsModel.itemsName!),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: Get.width - 20,
                margin:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: ClipOval(
                  child: CachedNetworkImage(
                    height: Get.height * 0.4,
                    imageUrl: itemsModel.itemsImage!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Get.theme.secondaryHeaderColor,
                          backgroundColor: Get.theme.primaryColor,
                        ),
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
                    decoration: BoxDecoration(
                        color: Get.theme.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Get.theme.primaryColor,
                          )),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                        color: Get.theme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text('${itemsModel.itemsPrice} \$'),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                        color: Get.theme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text('-${itemsModel.itemsDiscount} %'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width - 40,
                height: Get.height * 0.2,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                    color: Get.theme.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(child: Text(itemsModel.itemsDesc.toString())),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
