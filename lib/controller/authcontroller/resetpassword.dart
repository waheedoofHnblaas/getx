import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class ResetPasswordControllerVM extends GetxController {
  resetPssword();

}

class ResetPasswordController extends ResetPasswordControllerVM {
  late TextEditingController password;

  @override
  resetPssword() {}



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
}