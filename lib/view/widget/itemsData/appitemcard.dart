import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/data/model/item.dart';
import 'package:getx/view/widget/home/appcachiamge.dart';

class ItemCard extends StatelessWidget {
  ItemCard({required this.index, required this.items, Key? key})
      : super(key: key);

  List<ItemsModel> items;
  int index;
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return InkWell(
      onTap: () {
        controller.goToItemDataPage(items[index]);
      },
      child: GetX<HomeController>(
        builder: (controller) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: controller.offset.value == 0
                ? Get.theme.backgroundColor
                : Get.theme.primaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 190,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14),
                  ),
                  child: AppCachImage(imageUrl: items[index].itemsImage!),
                ),
              ),
              Text(
                items[index].itemsName!,
                textAlign: TextAlign.center,
                style: Get.textTheme.subtitle1!.copyWith(fontSize: 21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${items[index].itemsPrice!} \$',
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
                        '${items[index].itemsDiscount!}  %',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.subtitle1!.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
