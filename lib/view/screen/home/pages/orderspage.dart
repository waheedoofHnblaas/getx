import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';

class YourOrdersPage extends StatelessWidget {
  YourOrdersPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('YourOrdersPage'));
  }
}
