import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.second,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                cursorColor: AppColors.primary,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                validator: (v) {
                  return null;
                },
                keyboardType: TextInputType.name,
                style: const TextStyle(color: AppColors.primary),
                onChanged: (val) {},
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary)),
                  hintStyle: Get.theme.textTheme.bodyText1,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.search,
                        color: AppColors.primary),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary,
              ),
              child: IconButton(
                  color: AppColors.back,
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list)),
            ),
          )
        ],
      ),
    );
  }
}
