import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class ResetPasswordControllerVM extends GetxController {
  resetPassword();
}

class ResetPasswordController extends ResetPasswordControllerVM {
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  resetPassword() {
    if (formState.currentState!.validate()) {
      print('validate');
      Get.offNamed(AppRoute.successresetpassword);
    } else {
      print('not validate');
    }
  }



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