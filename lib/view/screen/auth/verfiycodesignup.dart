import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/forgetpasswordcontrollers/forgetcontroller.dart';
import 'package:getx/controller/authcontroller/forgetpasswordcontrollers/verfiycodecontroller.dart';
import 'package:getx/controller/authcontroller/verifiycodesignup.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationSignUpPage extends StatelessWidget {
  const VerificationSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerfiyCodeSignUpController controller = Get.put(VerfiyCodeSignUpController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Verification code',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),

      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppLoginTitel(title: 'Welcom Back'),
                const SizedBox(
                  height: 5,
                ),
                const AppLoginSubTitle(
                  subtitle: 'enter code that you recieve\nin your account',
                ),
                const SizedBox(
                  height: 33,
                ),
                OtpTextField(
                  focusedBorderColor: AppColors.primary,
                  fieldWidth: 50,
                  margin: const EdgeInsets.all(8),
                  numberOfFields: 5,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: AppColors.primary,
                  textStyle: Get.textTheme.headline1!.copyWith(
                    color: AppColors.primary,
                  ),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.checkCode();
                  }, // end onSubmit
                ),
                AppSignUpAndLoginButton(text: 'Check Code', onPressed: () { controller.checkCode();}),
                const SizedBox(
                  height: 10,
                ),
                AppLoginSignUp(
                  textone: 'Don\'t have account ? ',
                  texttwo: 'Sign up',
                  onPressed: () {
                    Get.offNamed(AppRoute.signup);
                  },
                )
              ],
            ),
          )),
    );
  }
}
