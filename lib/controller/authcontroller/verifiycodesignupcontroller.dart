import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/verifiydata.dart';

abstract class VerifiyCodeSignUpControllerVM extends GetxController {
  checkCode();

//  toSuccessSignUp();
}

class VerifiyCodeSignUpController extends VerifiyCodeSignUpControllerVM {
  late TextEditingController code;
  late String email;
  StatusRequest? statusRequest;

  final VerifiyData verifiyData = VerifiyData(Get.find());

  @override
  checkCode() async {
    statusRequest = StatusRequest.loading;
    update();
    print('verifiy email : ${email}  with code : ${code.text}');

    var response = await verifiyData.verifiyData(
        email: email, verifiyCode: code.text
    );
    statusRequest = handlingData(response);
    print(response.toString() + '------');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offAllNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'incorrect code',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: AppColors.back,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

    // @override
    // toSuccessSignUp() {
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