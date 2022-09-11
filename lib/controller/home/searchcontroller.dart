import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
   onBack(context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
      return false;
    } else {
      return true;
    }
  }
}