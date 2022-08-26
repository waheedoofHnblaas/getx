import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/signupcontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/view/widget/auth/apploginlogo.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Sign Up',
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
              subtitle: 'Sign Up with your Details or\nBy social media',
            ),
            const SizedBox(
              height: 33,
            ),
            AppTextField(
              Controller: controller.username,
              type: 'User Name',
              iconData: Icons.person_outline,
              inputType: TextInputType.name,
              onChanged: (val) {},
            ),
            AppTextField(
              Controller: controller.email,
              type: 'Email',
              iconData: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
              onChanged: (val) {},
            ),
            AppTextField(
              Controller: controller.phone,
              type: 'Phone',
              iconData: Icons.phone_outlined,
              inputType: TextInputType.number,
              onChanged: (val) {},
            ),
            AppTextField(
              Controller: controller.password,
              type: 'Password',
              iconData: Icons.password_outlined,
              inputType: TextInputType.visiblePassword,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 10,
            ),
            AppSignUpAndLoginButton(
                text: 'Sign Up',
                onPressed: () {
                  controller.signup();
                }),
            const SizedBox(
              height: 10,
            ),
            AppLoginSignUp(
              textone: 'You have account ? ',
              texttwo: 'Login',
              onPressed: () {
                Get.offNamed(AppRoute.login);
              },
            )
          ],
        ),
      )),
    );
  }
}
