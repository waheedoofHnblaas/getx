import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class ResetData {
  Crud crud;

  ResetData(this.crud);

  resetData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(AppLinks.resetPasswordLink, {
      'password': password,
      'email': email
    });
    return response.fold((l) => l, (r) => r);
  }
}