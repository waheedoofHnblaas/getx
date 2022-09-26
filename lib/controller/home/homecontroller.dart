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
  List<CategoriesModel> categoriesList = [];
  List<ItemsModel> itemsList = [];
  List<ItemsModel> categoriesOfItemsList = [];
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
    itemsList = await getHomeData();
    print('element.itemsDiscount=====');
    if (itemsList.isNotEmpty) {
      for (ItemsModel element in itemsList) {
        if (int.parse(discountItemsModel.itemsDiscount!) <
            int.parse(element.itemsDiscount!)) {
          print(element.itemsDiscount);
          print(itemsList.length);
          discountItemsModel = element;
        }
      }
    }

    update();
  }

  @override
  Future<List<ItemsModel>> getHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');
    itemsList.clear();
    var response = await homeData.homeData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List categories = await response['categories'];
        for (var element in categories) {
          categoriesList.add(CategoriesModel.fromJson(element));
        }
        List items = [];
        if (response['items'] != []) {
          items = response['items'];
        }
        for (var element in items) {
          itemsList.add(ItemsModel.fromJson(element));
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
    Get.showSnackbar( GetSnackBar(
      backgroundColor: Get.theme.backgroundColor,
      messageText: const Center(
          child: Text(
        'done update',
        style: TextStyle(color: Colors.greenAccent),
      )),
      duration: const Duration(
        seconds: 2,
      ),
    ));
    update();
    return itemsList;
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
        'catList': categoriesOfItemsList,
        'categoriesList': categoriesList,
      },
    );
  }

  @override
  getCategoriesItems(String id) {
    categoriesOfItemsList.clear();
    for (ItemsModel element in itemsList) {
      if (element.categoriesId == id) {
        categoriesOfItemsList.add(element);
      } else {
        categoriesOfItemsList.remove(element);
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
