import 'dart:io';

import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class DeleteItemData {
  Crud crud;

  DeleteItemData(this.crud);

  deleteItemData({
    required String  item_id,
    required String item_imageName,
  }) async {
    var response = await crud.postData(AppLinks.deleteItemLink, {
      'id':item_id,
      'items_imageName':item_imageName
    });
    return response.fold((l) => l, (r) => r);
  }
}
