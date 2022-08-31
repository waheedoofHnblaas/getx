import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/signupcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/core/function/alterexitapp.dart';
import 'package:getx/core/function/validinput.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: WillPopScope(
        onWillPop: AlterExitApp,
        child: GetBuilder<SignUpController>(builder: (controller) {
          if(controller.statusRequest==StatusRequest.loading){
            return Center(child: Lottie.asset(AppImagesAssets.loading));
          }else{
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
                          subtitle:
                          'Sign Up with your Details or\nBy social media',
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        AppTextField(
                          validator: (val) {
                            controller.username =
                                TextEditingController(text: val);
                            return validInput(val!, 8, 50, 'username');
                          },
                          controller: controller.username,
                          type: 'User Name',
                          iconData: Icons.person_outline,
                          inputType: TextInputType.name,
                          onChanged: (val) {},
                        ),
                        AppTextField(
                          validator: (val) {
                            controller.email = TextEditingController(text: val);
                            return validInput(val!, 8, 50, 'email');
                          },
                          controller: controller.email,
                          type: 'Email',
                          iconData: Icons.email_outlined,
                          inputType: TextInputType.emailAddress,
                          onChanged: (val) {},
                        ),
                        AppTextField(
                          validator: (val) {
                            controller.phone = TextEditingController(text: val);
                            return validInput(val!, 8, 50, 'phone');
                          },
                          controller: controller.phone,
                          type: 'Phone',
                          iconData: Icons.phone_outlined,
                          inputType: TextInputType.number,
                          onChanged: (val) {},
                        ),
                        GetBuilder<SignUpController>(
                            builder: (controller) => AppTextField(
                              obscureText: controller.showText,
                              onTap: () {
                                controller.changeShow();
                              },
                              validator: (val) {
                                controller.password =
                                    TextEditingController(text: val);
                                return validInput(val!, 8, 50, 'password');
                              },
                              controller: controller.password,
                              type: 'Password',
                              iconData: Icons.password_outlined,
                              inputType: TextInputType.visiblePassword,
                              onChanged: (val) {},
                            )),
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
                ));
          }

        }),
      ),
    );
  }
}
