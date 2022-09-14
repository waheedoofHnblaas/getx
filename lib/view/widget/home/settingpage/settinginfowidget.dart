import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/personcontroller.dart';
import 'package:getx/core/constant/themesdata/themes.dart';

class AppSettingInfoWidget extends StatelessWidget {
  const AppSettingInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonController>(
      builder: (personController) {
        print(AppThemes().getCurrentThemeMode());
        print('======================');
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppThemes().getCurrentTheme().shadowColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                size: 100,
                color: AppThemes().getCurrentTheme().primaryColor,
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                personController.email,
                style: AppThemes().getCurrentTheme().textTheme.bodyText2,
              ),
              Text(
                personController.phone,
                style: AppThemes().getCurrentTheme().textTheme.bodyText2,
              ),
              Text(
                personController.name,
                style: AppThemes().getCurrentTheme().textTheme.bodyText2,
              ),
              Text(
                personController.createDate,
                style: AppThemes().getCurrentTheme().textTheme.bodyText2,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
