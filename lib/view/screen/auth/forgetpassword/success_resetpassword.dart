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

class SuccessResetPage extends StatelessWidget {
  const SuccessResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CheckEmailController controller = Get.put(CheckEmailController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Success Reset Password',
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
              subtitle:
                  'you reset new password to your acount\nnow enter and enjoy',
            ),
            const SizedBox(
              height: 33,
            ),
            AppSignUpAndLoginButton(
                text: 'Enter',
                onPressed: () {
                  // controller.toSuccessSignUp();
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
