

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/resetpassword.dart';
import 'package:getx/controller/authcontroller/verfiycodecontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Reset password',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.back,
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
                  subtitle: 'enter you new password',
                ),
                const SizedBox(
                  height: 33,
                ),
                AppTextField(

                  Controller: controller.resetPssword(),
                  type: 'New Password',
                  iconData: Icons.password_outlined,
                  inputType: TextInputType.visiblePassword,
                  onChanged: (val) {},
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
