import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class TestData{

  Crud crud;
  TestData(this.crud);

  getData()async{
    var response = await crud.postData(AppLinks.getUsersLink, {});
   return response.fold((l) => l, (r) => r);
  }


}