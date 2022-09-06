import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/data/datasource/remote/home/homeData.dart';
import 'package:getx/data/model/categories.dart';
import 'package:getx/data/model/item.dart';

abstract class HomeControllerImp extends GetxController {
  changePage(int i);

  getHomeData();
}

class HomeController extends HomeControllerImp {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  List<CategoriesModel> categoriesController = [];
  List<itemsModel> itemsController = [];

  var currentPage = 0.obs;

  final ScrollController scrollController = ScrollController();
  final offset = 0.0.obs;


  @override
  void onInit() {
    getHomeData();
    scrollController.addListener(() {
      offset.value = scrollController.offset;
      print(offset.value.toString());
    });
    super.onInit();
  }

  @override
  changePage(pageIndex) {
    currentPage = pageIndex.obs;
    print(currentPage);
    print('HomeController currentPage');
    update();
  }

  @override
  getHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');

    var response = await homeData.homeData();
    statusRequest = handlingData(response);
    print('$response------');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List categories = await response['categories'];
        for (var element in categories) {
          categoriesController.add(CategoriesModel.fromJson(element));
        }
        List items = await response['items'];
        for (var element in items) {
          itemsController.add(itemsModel.fromJson(element));
        }
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no data available',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: AppColors.back,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
