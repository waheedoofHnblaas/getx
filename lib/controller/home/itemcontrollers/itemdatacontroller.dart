import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/data/model/item.dart';

class ItemDataController extends GetxController {
  Map<ItemsModel, int> items = {};

  @override
  void onInit() {
    super.onInit();
  }

  incItem(ItemsModel item) {
    if (items.containsKey(item)) {
      int count = items[item]! + 1;
      items.update(item, (value) => count);
    } else {
      items.addAll({item: 1});
    }
    update();
  }

  decItem(ItemsModel item) {
    if (items.containsKey(item)) {
      if (items[item] == 1) {
        items.remove(item);
      } else {
        items.update(item, (value) => items[item]! - 1);
      }
    }
    update();
  }
  deleteAll() {
    items.clear();
    update();
  }

  int? getCount(ItemsModel item) {
    print(items);
    return items[item] ?? 0;
  }

  double getCost() {
    double cost = 0;
    for (var element in items.keys) {
      cost += getCount(element)! * int.parse(element.itemsPrice!);
    }

    return cost;
  }

  goToItemDataPage(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemdata, arguments: {'item': itemsModel});
  }

  Map<ItemsModel, int> getPasketItems() => items;
}
