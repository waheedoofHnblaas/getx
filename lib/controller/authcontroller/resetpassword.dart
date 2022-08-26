import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class ResetPasswordControllerVM extends GetxController {
  resetPassword();
  toSuccess();
}

class ResetPasswordController extends ResetPasswordControllerVM {
  late TextEditingController password;

  @override
  resetPassword() {}



  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    password.dispose();
    super.dispose();
  }

  @override
  toSuccess() {
    Get.offNamed(AppRoute.successresetpassword);
  }
}