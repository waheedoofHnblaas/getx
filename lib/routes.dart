import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/middelware.dart';
import 'package:getx/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:getx/view/screen/auth/login.dart';
import 'package:getx/view/screen/auth/signup.dart';
import 'package:getx/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:getx/view/screen/auth/success_signup.dart';
import 'package:getx/view/screen/auth/verfiycodesignup.dart';
import 'package:getx/view/screen/language.dart';
import 'package:getx/view/screen/onboarding.dart';

import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const LanguagePage(),
    middlewares: [MiddleWare()],
  ),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.login, page: () => const LoginPage()),
  GetPage(name: AppRoute.signup, page: () => const SignUpPage()),
  GetPage(name: AppRoute.forget, page: () => const ForgetPasswordPage()),
  GetPage(name: AppRoute.verfiy, page: () => const VerificationPage()),
  GetPage(
      name: AppRoute.verfiysignup, page: () => const VerificationSignUpPage()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPasswordPage()),
  GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPage()),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignUpPage()),
];
