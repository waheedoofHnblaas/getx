import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class VerifiyData {
  Crud crud;

  VerifiyData(this.crud);

  verifiyData({
    required String verifiyCode,
    required String email,
  }) async {
    var response = await crud.postData(AppLinks.verifiySignupLink, {
      'email': email,
      'verifycode': verifiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}