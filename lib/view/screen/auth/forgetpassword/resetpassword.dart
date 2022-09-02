import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/forgetpasswordcontrollers/resetpassword.dart';
import 'package:getx/controller/authcontroller/forgetpasswordcontrollers/verfiycodecontroller.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/core/function/validinput.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Reset password',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller) {
        if (StatusRequest.loading == controller.statusRequest) {
          return Center(child: Lottie.asset(AppImagesAssets.loading));
        } else {
          return Center(
              child: SingleChildScrollView(
            child: Form(
              key: controller.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AppLoginTitel(title: 'Welcome Back'),
                  const SizedBox(
                    height: 5,
                  ),
                  const AppLoginSubTitle(
                    subtitle: 'enter you new password',
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  AppTextField(
                    validator: (val) {
                      controller.password = TextEditingController(text: val);
                      return validInput(val!, 8, 50, 'password');
                    },
                    //controller: controller.password,
                    type: 'New Password',
                    iconData: Icons.password_outlined,
                    inputType: TextInputType.visiblePassword,
                    onChanged: (val) {},
                  ),
                  AppSignUpAndLoginButton(
                      text: 'Reset',
                      onPressed: () {
                        controller.resetPassword();
                      }),
                  AppLoginSignUp(
                    textone: 'Don\'t have account ? ',
                    texttwo: 'Sign up',
                    onPressed: () {
                      Get.offNamed(AppRoute.signup);
                    },
                  )
                ],
              ),
            ),
          ));
        }
      }),
    );
  }
}
