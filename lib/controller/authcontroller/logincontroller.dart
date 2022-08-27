import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class LoginControllerVM extends GetxController {
  login();

  toSignUp();

  toForget();
}

class LoginController extends LoginControllerVM {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  login() {
    if (formState.currentState!.validate()) {
      print('validate');
    } else {
      print('not validate');
    }
  }

  @override
  toSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  toForget() {
    Get.toNamed(AppRoute.forget);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
