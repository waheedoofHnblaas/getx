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
    required this.validator,
    this.obscureText = false,
    this.onTap,
    required this.textFieldController,
  }) : super(key: key);

  late String type;
  late bool obscureText;
  late IconData iconData;
  late TextInputType inputType;
  late String? Function(String?)? onChanged;
  late String? Function(String?)? validator;
  final void Function()? onTap;
  late TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: textFieldController,
        validator: validator,
        keyboardType: inputType,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Get.theme.primaryColor),
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.primaryColor),
            borderRadius: BorderRadius.circular(18),
          ),
          hintStyle: Get.theme.textTheme.bodyText1,
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(
              iconData,
              color: Get.theme.primaryColor,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              type,
              style: Get.textTheme.bodyText2!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: type,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
