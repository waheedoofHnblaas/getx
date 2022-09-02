import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  homeData() async {
    var response = await crud.postData(AppLinks.homeDataLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
