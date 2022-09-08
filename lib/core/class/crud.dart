import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:getx/core/class/statusrequest.dart';
import 'package:getx/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String urlLink, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(urlLink), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responceBody = jsonDecode(response.body);
          print('==========responceBody.length================');
          print(responceBody.length);
          print('==========Crud================');
          return Right(responceBody);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offline);
      }
    } catch (_) {
      return const Left(StatusRequest.serverExp);
    }
  }
}
