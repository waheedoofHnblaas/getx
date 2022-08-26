import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class VerfiyCodeControllerVM extends GetxController {
  checkCode();

  toResetPassword();
}

class VerfiyCodeController extends VerfiyCodeControllerVM {
  late TextEditingController code;

  @override
  checkCode() {}

  @override
  toResetPassword() {
    Get.offNamed(AppRoute.resetpassword);
  }

  @override
  void onInit() {
    code = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    code.dispose();
    super.dispose();
  }
}