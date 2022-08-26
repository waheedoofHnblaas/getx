import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.type,
    required this.iconData,
    required this.inputType,
    required this.onChanged,
    required this.Controller,
  }) : super(key: key);

  late String type;
  late TextEditingController Controller;
  late IconData iconData;
  late TextInputType inputType;
  late void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: TextFormField(
        keyboardType: inputType,
        style: const TextStyle(color: AppColors.primary),
        decoration: InputDecoration(
          hintStyle: Get.theme.textTheme.bodyText1,
          suffixIcon: Icon(iconData),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('$type'),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'inter your $type',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
