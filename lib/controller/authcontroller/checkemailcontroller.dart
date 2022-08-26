import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class CheckEmailControllerVM extends GetxController {
  checkEmail();

  toSuccessSignUp();
}

class CheckEmailController extends CheckEmailControllerVM {
  late TextEditingController email;

  @override
  checkEmail() {}

  @override
  toSuccessSignUp() {
    Get.offNamed(AppRoute.successSignup);
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
