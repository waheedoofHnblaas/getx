import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/signupcontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/validinput.dart';
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
        child: Form(
          key: controller.formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppLoginTitel(title: 'Welcom Back'),
              const SizedBox(
                height: 5,
              ),
              const AppLoginSubTitle(
                subtitle: 'Sign Up with your Details or\nBy social media',
              ),
              const SizedBox(
                height: 33,
              ),
              AppTextField(
                validator: (val){
                  return validInput(val!, 8, 30, 'username');
                },
                controller: controller.username,
                type: 'User Name',
                iconData: Icons.person_outline,
                inputType: TextInputType.name,
                onChanged: (val) {},
              ),
              AppTextField(
                validator: (val){
                  return validInput(val!, 8, 30, 'email');

                },
                controller: controller.email,
                type: 'Email',
                iconData: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                onChanged: (val) {},
              ),
              AppTextField(
                validator: (val){
                  return validInput(val!, 8, 30, 'phone');

                },
                controller: controller.phone,
                type: 'Phone',
                iconData: Icons.phone_outlined,
                inputType: TextInputType.number,
                onChanged: (val) {},
              ),
              AppTextField(
                validator: (val){
                  return validInput(val!, 8, 30, 'password');
                },
                controller: controller.password,
                type: 'Password',
                iconData: Icons.password_outlined,
                inputType: TextInputType.visiblePassword,
                onChanged: (val) {},
              ),
              const SizedBox(
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
        ),
      )),
    );
  }
}
