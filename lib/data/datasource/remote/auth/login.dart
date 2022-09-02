import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  loginData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(AppLinks.loginLink, {
      'password': password,
      'email': email
    });
    return response.fold((l) => l, (r) => r);
  }
}