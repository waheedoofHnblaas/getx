import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginControllerVM extends GetxController {
  login();

  toSignUp();

  toForget();
}

class LoginController extends LoginControllerVM {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  late bool showText = true;
  StatusRequest? statusRequest = StatusRequest.none;
  final LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  changeShow() {
    showText = !showText;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('login with ${email.text} and ${password.text}');

      var response = await loginData.loginData(
        email: email.text,
        password: password.text,
      );
      statusRequest = handlingData(response);
      print('$response------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          myServices.sharedPreferences
              .setString('id', response['data']['users_id']);
          myServices.sharedPreferences
              .setString('name', response['data']['users_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myServices.sharedPreferences
              .setString('phone', response['data']['users_phone']);
          myServices.sharedPreferences
              .setString('createDate', response['data']['users_create']);
          myServices.sharedPreferences
              .setString('step', '2');
          Get.offAllNamed(AppRoute.home);
        } else {
          Get.defaultDialog(
            title: 'Warning',
            titleStyle: Get.textTheme.headline1,
            middleText: 'email or password is wrong',
            middleTextStyle: Get.textTheme.bodyText1,
            backgroundColor:  Get.theme.backgroundColor,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
    FirebaseMessaging.instance.getToken().then((value) {
      print('FirebaseMessaging.instance.getToken');
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    showText = true;
    super.dispose();
  }
}
