import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/testcontroller.dart';
import 'package:getx/core/class/handelingview.dart';
import 'package:getx/core/class/statusrequest.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: Center(
        child: GetBuilder<TestController>(builder: (controller) {
          return HandelingView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: Text(
                          controller.data[index]['users_email'].toString()));
                },
              ));
        }),
      ),
    );
  }
}
