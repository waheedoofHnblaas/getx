import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        query != ''
            ? controller.goToItemDataPage(filterNames[index])
            : controller.goToItemDataPage(controller.itemsController[index]);
      },
      child: ListTile(
        title: query != ''
            ? Text(
                filterNames[index].itemsName.toString(),
              )
            : Text(
                controller.itemsController[index].itemsName.toString(),
              ),
        trailing: query != ''
            ? Text(
                '${filterNames[index].itemsPrice} \$',
                style: Get.textTheme.subtitle1,
              )
            : Text(
                '${controller.itemsController[index].itemsPrice} \$',
                style: Get.textTheme.subtitle1,
              ),
      ),
    );
  }
}
