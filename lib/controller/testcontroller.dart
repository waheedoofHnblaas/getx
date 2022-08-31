import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/function/handlingdata.dart';
import 'package:getx/data/datasource/remote/test.dart';

class TestController extends GetxController {
  final TestData _testData = TestData(Get.find());
  late StatusRequest statusRequest;

  late List data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await _testData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status']=='success'){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
