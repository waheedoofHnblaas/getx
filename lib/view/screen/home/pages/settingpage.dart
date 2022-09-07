import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/constant/colors.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  PersonController personController = Get.find();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: AppColors.primaryShadow,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  personController.email!,
                  style: Get.textTheme.bodyText2,
                ),
                Text(
                  personController.phone!,
                  style: Get.textTheme.bodyText2,
                ),
                Text(
                  personController.name!,
                  style: Get.textTheme.bodyText2,
                ),
                Text(
                  personController.createDate!,
                  style: Get.textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColors.primaryShadow,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    tooltip: 'logout',
                    onPressed: () async {
                      await homeController.logout();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: AppColors.primary,
                      size: 33,
                    )),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                    tooltip: 'edit',
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.primary,
                      size: 33,
                    )),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                    tooltip: 'settings',
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sunny,
                      color: AppColors.primary,
                      size: 33,
                    )),
              ],
            ),
          ),
          const SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }
}
