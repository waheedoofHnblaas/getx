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
  }) : super(key: key);

  late String type;
  late bool obscureText;
  late IconData iconData;
  late TextInputType inputType;
  late void Function(String)? onChanged;
  late String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: TextFormField(
        validator: validator,
        keyboardType: inputType,
        obscureText: obscureText,
        style: const TextStyle(color: AppColors.primary),
        decoration: InputDecoration(
          hintStyle: Get.theme.textTheme.bodyText1,
          suffixIcon: IconButton(onPressed: onTap, icon: Icon(iconData)),
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
