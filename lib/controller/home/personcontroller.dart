import 'package:get/get.dart';
import 'package:getx/core/services/services.dart';

class PersonController extends GetxController{
  String? email,name,phone,createDate,id ;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    initialUserData();
    super.onInit();
  }
  initialUserData() async{
    id = myServices.sharedPreferences.getString('id');
    email = myServices.sharedPreferences.getString('email');
    name = myServices.sharedPreferences.getString('name');
    phone = myServices.sharedPreferences.getString('phone');
    createDate = myServices.sharedPreferences.getString('createDate');
  }
}