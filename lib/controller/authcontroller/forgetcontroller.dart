import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class ForgetControllerVM extends GetxController {
  checkEmail();

  toVerfiyCode();
}

class ForgetController extends ForgetControllerVM {
  late TextEditingController email;

  @override
  checkEmail() {}

  @override
  toVerfiyCode() {
    Get.offNamed(AppRoute.verfiy);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
  }
}
