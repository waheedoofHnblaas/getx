import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/data/datasource/remote/home/homeData.dart';
import 'package:getx/data/model/categories.dart';
import 'package:getx/data/model/item.dart';
import 'package:get/get.dart';

abstract class HomeControllerImp extends GetxController {
  changePage(int i);
  onPageChanged(int i);
  logout();

  getHomeData();

  getCategoriesItems(String id);

  void getSummerDiscount();
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  goToItemDataPage(ItemsModel);
  goToCategoriesPage(String id, String name);
}

class HomeController extends HomeControllerImp {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  final HomeData homeData = HomeData(Get.find());
  List<CategoriesModel> categoriesController = [];
  List<ItemsModel> itemsController = [];
  List<ItemsModel> categoriesItemsController = [];
  int currentPage = 0;

  ItemsModel discountItemsModel = ItemsModel(itemsDiscount: '0');
  final offset = 0.0.obs;

  @override
  void onInit() {
    getSummerDiscount();
   
    super.onInit();
  }

  PageController pageController = PageController();

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(pageIndex) {
    currentPage = pageIndex;
    pageController.jumpToPage(currentPage);
    // ignore: avoid_print
    print(currentPage);
    // ignore: avoid_print
    print('HomeController currentPage');
    update();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  onPageChanged(index) {
    currentPage = index;
    update();
  }

  @override
  void getSummerDiscount() async {
    itemsController = await getHomeData();
    print('element.itemsDiscount=====');
    for (ItemsModel element in itemsController) {
      if (int.parse(discountItemsModel.itemsDiscount!) <
          int.parse(element.itemsDiscount!)) {
        print(element.itemsDiscount);
        print(itemsController.length);
        discountItemsModel = element;
      }
    }
    update();
  }

  @override
  Future<List<ItemsModel>> getHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');

    var response = await homeData.homeData();
    statusRequest = handlingData(response);
    print('${response['categories'][1]['categories_name']}------');
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
          backgroundColor: Get.theme.backgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return itemsController;
  }

  @override
  logout() async {
    try {
      Get.defaultDialog(
        title: 'Logout',
        titleStyle: Get.textTheme.headline1,
        middleText: 'Do you want to logout ?',
        backgroundColor: Get.theme.backgroundColor,
        onConfirm: () async {
          await myServices.sharedPreferences.setString('step', '1');
          Get.offAllNamed(AppRoute.login);
        },
        onCancel: () {
          Get.back();
        },
      );
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
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  goToItemDataPage(ItemsModel) {
    Get.toNamed(AppRoute.itemdata, arguments: {'item': ItemsModel});
  }
}
