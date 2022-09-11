import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetControllerVM extends GetxController {
  checkEmail();

}

class ForgetController extends ForgetControllerVM {
  late TextEditingController email;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none;
  final CheckData checkData = CheckData(Get.find());

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print('ForgetController with ${email.text}');

      var response = await checkData.checkData(email: email.text);
      statusRequest = handlingData(response);
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print(response.toString()+'------');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.toNamed(AppRoute.verfiy,arguments: {'email' : email.text});
        } else {
          Get.defaultDialog(
            title: 'Warning',
            titleStyle: Get.textTheme.headline1,
            middleText: 'email is wrong',
            middleTextStyle: Get.textTheme.bodyText1,
            backgroundColor:Get.theme.backgroundColor,
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
