import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/view/screen/auth/checkemail.dart';
import 'package:getx/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:getx/view/screen/auth/login.dart';
import 'package:getx/view/screen/auth/signup.dart';
import 'package:getx/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:getx/view/screen/auth/success_signup.dart';
import 'package:getx/view/screen/onboarding.dart';

import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login:(context)=> const LoginPage(),
  AppRoute.onboarding:(context)=> const OnBoarding(),
  AppRoute.signup:(context)=> const SignUpPage(),
  AppRoute.forget:(context)=> const ForgetPasswordPage(),
  AppRoute.verfiy:(context)=> const VerificationPage(),
  AppRoute.resetpassword:(context)=> const ResetPasswordPage(),
  AppRoute.successresetpassword:(context)=> const SuccessResetPage(),
  AppRoute.successSignup:(context)=> const SuccessSignUpPage(),
  AppRoute.checkemail:(context)=> const CheckEmailPage(),
};