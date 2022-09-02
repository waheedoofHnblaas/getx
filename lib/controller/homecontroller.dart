import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/data/datasource/remote/home/homeData.dart';

abstract class HomeControllerImp extends GetxController{
initialUserData();
getHomeData();
}

class HomeController extends HomeControllerImp{
 String? email,name,phone,createDate,id ;
 MyServices myServices = Get.find();
 StatusRequest? statusRequest = StatusRequest.none;
 final HomeData homeData = HomeData(Get.find());
 var categories = [];
 var items = [];

 @override
  void onInit() {
   initialUserData();
    getHomeData();
    super.onInit();

  }

  @override
  initialUserData() async{
    id = myServices.sharedPreferences.getString('id');
    email = myServices.sharedPreferences.getString('email');
    name = myServices.sharedPreferences.getString('name');
    phone = myServices.sharedPreferences.getString('phone');
    createDate = myServices.sharedPreferences.getString('createDate');
  }

  @override
  getHomeData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('getHomeData');

    var response = await homeData.homeData();
    statusRequest = handlingData(response);
    print('$response------');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        Get.defaultDialog(
          title: 'Warning',
          titleStyle: Get.textTheme.headline1,
          middleText: 'no data available',
          middleTextStyle: Get.textTheme.bodyText1,
          backgroundColor: AppColors.back,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}