import 'package:get/get.dart';
import 'package:getx/core/constant/imagesassets.dart';
import 'package:getx/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: '1'.tr,
      body: '2'.tr,
      image: AppImagesAssets.onBoardingImageChoose),
  OnBoardingModel(
      title: 'Easy & Safe Payment',
      body:
          'Easy Checkout & Safe Payment\nmethod.'
              ' Trusted by our Customers\nfrom all over the world.',
      image: AppImagesAssets.onBoardingImagePayment),
  OnBoardingModel(
      title: 'Track Your Order',
      body:
          'Best Tracker has been Used For\nTrack your order.'
              'You will know where\nyour product is at the moment',
      image: AppImagesAssets.onBoardingImageTrack),
  OnBoardingModel(
      title: 'Fast Delivery',
      body:
          'Reliable And Fast Delivery .'
              ' We\nDeliver your product the fastest\nway possible',
      image: AppImagesAssets.onBoardingImageFast),
];
