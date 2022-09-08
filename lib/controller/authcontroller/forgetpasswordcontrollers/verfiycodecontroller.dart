import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/auth/verifiydata.dart';
import 'package:getx/data/datasource/remote/forgetpassword/verifiycode.dart';

abstract class VerfiyCodeControllerVM extends GetxController {
  checkForgetCode();

// toResetPassword();
}

class VerfiyCodeController extends VerfiyCodeControllerVM {
  late TextEditingController code;
  StatusRequest? statusRequest = StatusRequest.none;
  late String email;

  final VerifiyForgetData verifiyData = VerifiyForgetData(Get.find());

  @override
  checkForgetCode() async {
    statusRequest = StatusRequest.loading;
    update();
    print('VerfiyCodeController with $email and code ${code.text}');

    var response = await verifiyData.verifiyForgetData(
      verifiyCode: code.text,
      email: email,
    );
    statusRequest = handlingData(response);
    print('$response------');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offAllNamed(AppRoute.resetpassword,arguments: {'email' : email});
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'code is not correct',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: Get.theme.backgroundColor,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // @override
  // toResetPassword() {
  //
  // }

  @override
  void onInit() {
    email = Get.arguments['email'];
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
