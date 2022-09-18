import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/itemcontrollers/itemdatacontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/datasource/static/homepagelist.dart';
import 'package:getx/data/model/item.dart';
import 'package:getx/view/widget/home/appbarhome.dart';
import 'package:getx/view/widget/itemsData/appitemdataappbar.dart';
import 'package:getx/view/widget/itemsData/itemprocesswidget.dart';

class ItemDataPage extends StatelessWidget {
  const ItemDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    orderDataController itemDataController = Get.find();
    ItemsModel itemsModel = Get.arguments['item'];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        automaticallyImplyLeading: false,
        title: AppItemDataAppBar(itemName: itemsModel.itemsName!),
      ),
      body: PageView(
        children: [
          Stack(
            children: [
              ListView(
                children: [
                  Container(
                    width: Get.width - 20,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 20),
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: Get.theme.shadowColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text('${itemsModel.itemsPrice} \$'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: Get.theme.shadowColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text('-${itemsModel.itemsDiscount} %'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: Get.theme.shadowColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call_outlined,
                                color: Get.theme.primaryColor,
                              )),
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 1),
                    decoration: BoxDecoration(
                        color: Get.theme.shadowColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Center(
                          child: Text(
                        itemsModel.itemsDesc.toString(),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.15,
                  )
                ],
              ),
              Positioned(
                bottom: Get.height * 0.05,
                right: 80,
                left: 80,
                child: ItemProcessWidget(
                  itemsModel: itemsModel,
                ),
              ),
            ],
          ),
          PageList[1]
        ],
      ),
    );
  }
}
