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
import 'package:getx/view/screen/home/itemdata.dart';

abstract class HomeControllerImp extends GetxController {
  changePage(int i);

  logout();

  getHomeData();

  getCategoriesItems(String id);

  goToItemDataPage(ItemsModel);
  goToCategoriesPage(String id, String name);
}

class HomeController extends HomeControllerImp {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  List<CategoriesModel> categoriesController = [];
  List<ItemsModel> itemsController = [];
  ScrollController scrollController = ScrollController();
  List<ItemsModel> categoriesItemsController = [];
  int currentPage = 0;

  final offset = 0.0.obs;

  @override
  void onInit() {
    getHomeData();
    scrollController.addListener(() {
      offset.value = scrollController.offset;
      print(offset.value.toString());
      update();
    });
    super.onInit();
  }

  @override
  changePage(pageIndex) {
    currentPage = pageIndex;
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
          itemsController.add(ItemsModel.fromJson(element));
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

  void onTap(int i) {
    print('ScrollBottomNavigationBar $i');
    print('ScrollBottomNavigationBar ');
    changePage(i);
  }

  @override
  logout() async {
    try {
      await myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoute.login);
    } catch (_) {
      Get.offAllNamed(AppRoute.home);
    }
  }

  @override
  goToCategoriesPage(id, name) {
    Get.toNamed(
      AppRoute.categoriesdata,
      arguments: {
        'categories_id': id,
        'categories_name': name,
      },
    );
  }

  @override
  getCategoriesItems(String id) {
    categoriesItemsController.clear();
    for (ItemsModel element in itemsController) {
      if (element.categoriesId == id) {
        categoriesItemsController.add(element);
      } else {
        categoriesItemsController.remove(element);
      }
    }
    update();
  }

  @override
  goToItemDataPage(ItemsModel) {
    Get.toNamed(AppRoute.itemdata,arguments: {'item':ItemsModel});
  }
}
