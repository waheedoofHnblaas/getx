import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/checkemailcontroller.dart';
import 'package:getx/controller/authcontroller/forgetcontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailController controller = Get.put(CheckEmailController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Check Email',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppLoginTitel(title: 'Welcom Back'),
                const SizedBox(
                  height: 5,
                ),
                AppLoginSubTitle(
                  subtitle: 'enter your email and recieve password in your acount',
                ),
                const SizedBox(
                  height: 33,
                ),
                AppTextField(
                  Controller: controller.email,
                  type: 'Email',
                  iconData: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                  onChanged: (val) {},
                ),
                AppSignUpAndLoginButton(
                    text: 'Check Email',
                    onPressed: () {
                      controller.toSuccessSignUp();
                    }),
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
