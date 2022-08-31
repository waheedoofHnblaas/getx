import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/signup.dart';

abstract class SignUpControllerVM extends GetxController {
  signup();

  toLogin();
}

class SignUpController extends SignUpControllerVM {
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController username;
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  late bool showText = true;

  StatusRequest? statusRequest;
  final SignUpData signUpData = SignUpData(Get.find());
  late List data = [];

  changeShow() {
    showText = !showText;
    update();
  }

  @override
  signup() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('signup with ${email.text}');

      var response = await signUpData.signUpUser(
        email: email.text,
        password: password.text,
        phone: phone.text,
        username: username.text,
      );
      statusRequest = handlingData(response);
      print(response.toString()+'------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.toNamed(AppRoute.verfiysignup,arguments: {'email' : email.text});
        } else {
          Get.defaultDialog(
            title: 'Warning',
            titleStyle: Get.textTheme.headline1,
            middleText: 'user is existed',
            middleTextStyle: Get.textTheme.bodyText1,
            backgroundColor: AppColors.back,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('not validate');
    }
  }

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
    showText = true;

    super.dispose();
  }
}
