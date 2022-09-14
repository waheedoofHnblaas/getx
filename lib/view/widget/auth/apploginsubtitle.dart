import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoginSubTitle extends StatelessWidget {
  const AppLoginSubTitle({Key? key, required this.subtitle}) : super(key: key);

  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.bodyText1,
      ),
    );
  }
}
