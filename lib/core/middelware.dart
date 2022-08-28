import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/services/services.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  final MyServices _myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (_myServices.sharedPreferences.getString('first') == 'false') {
      return RouteSettings(name: AppRoute.login);
    }
  }
}
