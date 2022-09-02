import 'package:flutter/material.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:lottie/lottie.dart';

class HandelingView extends StatelessWidget {
  HandelingView({Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(child: Lottie.asset(AppImagesAssets.loading));
    } else if (statusRequest == StatusRequest.success) {
      return widget;
    } else if (statusRequest == StatusRequest.failure) {
      return const Text('no data');
    } else {
      return Lottie.asset(AppImagesAssets.error);
    }
  }
}

class HandelingRequest extends StatelessWidget {
  HandelingRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  final StatusRequest statusRequest;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(child: Lottie.asset(AppImagesAssets.loading));
    }
    // else if (statusRequest == StatusRequest.failure) {
    //   return const Text('no data');
    // }
    else if (statusRequest == StatusRequest.serverExp ||
        statusRequest == StatusRequest.offline) {
      return Center(child: Lottie.asset(AppImagesAssets.error));
    } else {
      return widget;
    }
  }
}
