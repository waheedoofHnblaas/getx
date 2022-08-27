import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/authcontroller/logincontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/core/function/alterexitapp.dart';
import 'package:getx/core/function/validinput.dart';
import 'package:getx/view/widget/auth/apploginlogo.dart';
import 'package:getx/view/widget/auth/apploginsignup.dart';
import 'package:getx/view/widget/auth/apploginsubtitle.dart';
import 'package:getx/view/widget/auth/applogintext.dart';
import 'package:getx/view/widget/auth/apptextfield.dart';
import 'package:getx/view/widget/auth/apploginbutton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        title: Text(
          'Login',
          style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
      ),
      body: WillPopScope(
        onWillPop: AlterExitApp,
        child: Center(
            child: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppLoginLogo(name: AppImagesAssets.logo),
                const AppLoginTitel(title: 'Welcom Back'),
                const SizedBox(
                  height: 5,
                ),
                const AppLoginSubTitle(
                  subtitle:
                      'Sign in with your Email and Password\nor continue with social media',
                ),
                const SizedBox(
                  height: 33,
                ),
                AppTextField(
                  validator: (val){
                    return validInput(val!, 10, 30, 'email');
                  },
                  controller: controller.email,
                  type: 'Email',
                  iconData: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
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
                AppSignUpAndLoginButton(text: 'Login',onPressed: (){
                  controller.login();
                }),
                const SizedBox(
                  height: 10,
                ),
                AppLoginSignUp(
                  textone: 'Forget my password !!',
                  texttwo: 'Reset',
                  onPressed: () {
                    controller.toForget();
                  },
                )
                ,
                AppLoginSignUp(
                  textone: 'Don\'t have account ? ',
                  texttwo: 'Sing Up',
                  onPressed: () {
                    controller.toSignUp();
                  },
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
