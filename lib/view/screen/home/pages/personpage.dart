import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/constant/colors.dart';

class PersonPage extends StatelessWidget {
  PersonPage({Key? key}) : super(key: key);

  PersonController personController = Get.find();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 100,
            color: AppColors.primary,
          ),
          const SizedBox(
            height: 100,
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
            height: 100,
          ),
          Row(
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
            ],
          )
        ],
      ),
    );
  }
}
