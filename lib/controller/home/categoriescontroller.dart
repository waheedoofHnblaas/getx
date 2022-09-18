import 'package:get/get.dart';
import 'package:getx/data/model/categories.dart';
import 'package:getx/data/model/item.dart';


class CategoriesController extends GetxController {
 late String categoriesId;
 late String categoriesName;
 List<ItemsModel> categoriesOfItemsList = [];
 List<CategoriesModel> categoriesList = [];

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  initial() {
    categoriesOfItemsList = Get.arguments['catList'];
    categoriesId = Get.arguments['categories_id'];
    categoriesName = Get.arguments['categories_name'];
    categoriesList = Get.arguments['categoriesList'];
    update();
  }
}
