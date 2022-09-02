import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class CheckData {
  Crud crud;

  CheckData(this.crud);

  checkData({
    required String email,
  }) async {
    var response = await crud.postData(AppLinks.checkEmailLink, {
      'email': email
    });
    return response.fold((l) => l, (r) => r);
  }
}