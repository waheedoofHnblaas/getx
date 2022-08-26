import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/view/screen/auth/forgetpassword.dart';
import 'package:getx/view/screen/auth/login.dart';
import 'package:getx/view/screen/auth/resetpassword.dart';
import 'package:getx/view/screen/auth/signup.dart';
import 'package:getx/view/screen/auth/verfiycode.dart';
import 'package:getx/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login:(context)=> const LoginPage(),
  AppRoute.onboarding:(context)=> const OnBoarding(),
  AppRoute.signup:(context)=> const SignUpPage(),
  AppRoute.forget:(context)=> const ForgetPasswordPage(),
  AppRoute.verfiy:(context)=> const VerificationPage(),
  AppRoute.resetpassword:(context)=> const ResetPasswordPage()
};