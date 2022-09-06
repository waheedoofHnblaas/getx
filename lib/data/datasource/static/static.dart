import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/bottomnavcontroller.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/data/model/onboardingmodel.dart';
import 'package:getx/view/screen/home/homepage.dart';
import 'package:getx/view/screen/home/personpage.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: '3', body: '4', image: AppImagesAssets.onBoardingImageChoose),
  OnBoardingModel(
      title: '5', body: '6', image: AppImagesAssets.onBoardingImagePayment),
  OnBoardingModel(
      title: '7', body: '8', image: AppImagesAssets.onBoardingImageTrack),
  OnBoardingModel(
      title: '9', body: '10', image: AppImagesAssets.onBoardingImageFast),
];

List<Widget> PageList = [HomePage(),PersonPage()];
