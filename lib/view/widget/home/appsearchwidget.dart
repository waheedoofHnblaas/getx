import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/constant/colors.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({Key? key}) : super(key: key);

  onBack(context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return onBack(context);
        },
        child: SliverAppBar(
          automaticallyImplyLeading: false,
          primary: true,
          floating: true,
          title: SizedBox(
            height: Get.height * 0.06,
            width: Get.width * 0.9,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Get.theme.shadowColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      cursorHeight: Get.height * 0.04,
                      keyboardAppearance: Brightness.dark,
                      cursorColor: Get.theme.primaryColor,
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      validator: (v) {
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      style:  TextStyle(color: Get.theme.primaryColor),
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon:  Icon(
                            CupertinoIcons.search,
                            color: Get.theme.primaryColor,
                          ),
                        ),
                        label: const Center(
                          child: Text("Search"),
                        ),
                        labelStyle: Get.theme.textTheme.headline1!.copyWith(
                          color: Get.theme.canvasColor.withOpacity(0.4),
                          fontSize: 18,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
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
                      color: Get.theme.shadowColor,
                    ),
                    child: IconButton(
                        color:Get.theme.primaryColor,
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
