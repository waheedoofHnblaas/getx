import 'package:get/get.dart';
import 'package:getx/controller/home/bottomnavcontroller.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/class/crud.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(HomeController(),permanent: true);
    Get.put(PersonController(),permanent: true);
    Get.put(BottomNavController(),permanent: true);
  }

}