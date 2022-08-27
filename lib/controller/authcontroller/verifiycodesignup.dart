import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class VerfiyCodeSignUpControllerVM extends GetxController {
  checkCode();

//  toSuccessSignUp();
}

class VerfiyCodeSignUpController extends VerfiyCodeSignUpControllerVM {
  late TextEditingController code;

  @override
  checkCode() {
    Get.offAllNamed(AppRoute.successSignup);
  }

  // @override
  // toSuccessSignUp() {
  //
  // }

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