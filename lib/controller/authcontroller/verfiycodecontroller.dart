import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class VerfiyCodeControllerVM extends GetxController {
  checkCode();

  toResetPassword();
}

class VerfiyCodeController extends VerfiyCodeControllerVM {
  late TextEditingController email;

  @override
  checkCode() {}

  @override
  toResetPassword() {
    Get.offNamed(AppRoute.resetpassword);
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