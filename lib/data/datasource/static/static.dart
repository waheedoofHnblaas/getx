import 'package:flutter/material.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/data/model/onboardingmodel.dart';
import 'package:getx/view/screen/home/pages/homepage.dart';
import 'package:getx/view/screen/home/pages/orderspage.dart';

import '../../../view/screen/home/pages/settingpage.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: '3', body: '4', image: AppImagesAssets.onBoardingJsonChoose),
  OnBoardingModel(
      title: '5', body: '6', image: AppImagesAssets.onBoardingJsonPayment),
  OnBoardingModel(
      title: '7', body: '8', image: AppImagesAssets.onBoardingJsonTrack),
  OnBoardingModel(
      title: '9', body: '10', image: AppImagesAssets.onBoardingJsonFast),
];

// ignore: non_constant_identifier_names
List<Widget> PageList = [HomePage(), YourOrdersPage(), SettingPage()];
