import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppLoginLogo extends StatelessWidget {
  const AppLoginLogo({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(name);
  }
}
