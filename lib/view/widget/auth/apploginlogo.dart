import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppLoginLogo extends StatelessWidget {
  const AppLoginLogo({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(name,width: Get.width/2,fit: BoxFit.cover,);
  }
}
