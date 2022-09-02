import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class VerifiyForgetData {
  Crud crud;

  VerifiyForgetData(this.crud);

  verifiyForgetData({
    required String email,
    required String verifiyCode,
  }) async {
    var response = await crud.postData(AppLinks.verifiyForgetCodeLink, {
      'verifycode': verifiyCode,
      'email': email
    });
    return response.fold((l) => l, (r) => r);
  }
}