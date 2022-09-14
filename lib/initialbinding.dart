import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(PersonController());
    Get.put(ThemeController());

    Get.put(GetMaterialController(), permanent: true);
  }
}
