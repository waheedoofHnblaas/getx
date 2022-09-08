import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordControllerVM extends GetxController {
  resetPassword();
}

class ResetPasswordController extends ResetPasswordControllerVM {
  late TextEditingController password;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String email;
  StatusRequest? statusRequest = StatusRequest.none;
  final ResetData resetData = ResetData(Get.find());

  @override
  resetPassword() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('ResetPasswordController with $email and password ${password.text}');

      var response = await resetData.resetData(
        email: email,
        password: password.text,
      );
      statusRequest = handlingData(response);
      print('$response------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.successresetpassword);
        } else {
          Get.defaultDialog(
            title: 'Warning',
            titleStyle: Get.textTheme.headline1,
            middleText: 'not correct try again',
            middleTextStyle: Get.textTheme.bodyText1,
            backgroundColor: Get.theme.backgroundColor,
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
  void onInit() {
    email = Get.arguments['email'];
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
