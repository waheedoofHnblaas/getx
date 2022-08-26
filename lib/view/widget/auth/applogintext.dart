import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoginTitel extends StatelessWidget {
  const AppLoginTitel({Key? key,required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.theme.textTheme.headline1,
    );
  }
}
