import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class ForgetControllerVM extends GetxController {
  checkEmail();

}

class ForgetController extends ForgetControllerVM {
  late TextEditingController email;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  checkEmail() {
    if (formState.currentState!.validate()) {
      print('validate');
      Get.toNamed(AppRoute.verfiy);
    } else {
      print('not validate');
    }
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
