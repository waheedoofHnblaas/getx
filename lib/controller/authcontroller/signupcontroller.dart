import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';

abstract class SignUpControllerVM extends GetxController {
  login();

  toLogin();
}

class SignUpController extends SignUpControllerVM {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController username;
  late TextEditingController password;

  @override
  login() {}

  @override
  toLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
