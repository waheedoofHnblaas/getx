import 'dart:io';

import 'package:getx/core/class/crud.dart';
import 'package:getx/links.dart';

class AddItemData {
  Crud crud;

  AddItemData(this.crud);

  addItemData({
    required String  item_name,
    required String  items_cat,
    required String  items_name_ar,
    required String  items_desc,
    required String  items_desc_ar,
    required String  items_count,
    required String  items_active,
    required String  items_price,
    required String  items_discount,
    required File  file,
  }) async {
    var response = await crud.postDataWithImage(AppLinks.addItemLink, {
      'items_name': item_name,
      'items_cat': items_cat,
      'items_name_ar': items_name_ar,
      'items_desc': items_desc,
      'items_desc_ar': items_desc_ar,
      'items_count': items_count,
      'items_active': items_active,
      'items_price': items_price,
      'items_discount': items_discount,
    },file);
    return response.fold((l) => l, (r) => r);
  }
}
