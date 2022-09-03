import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppCardSummery extends StatelessWidget {
  const AppCardSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: Get.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.card,
      ),
      child: Stack(
        children: [
          Positioned(
            right: -60,
            top: 10,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
                color: AppColors.secondCard,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'A Summer Surprise',
              style: Get.textTheme.bodyText1!.copyWith(
                  color: AppColors.back.withOpacity(0.9), fontSize: 21),
            ),
            subtitle: Text(
              'Cache back 20%',
              style: Get.textTheme.headline1!
                  .copyWith(color: AppColors.back, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}
