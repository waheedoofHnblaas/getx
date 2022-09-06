import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController{
  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;


  @override
  void onInit() {

    scrollController.addListener(() {
      offset.value = scrollController.offset;
      print(offset.value.toString());
    });

    super.onInit();
  }
}