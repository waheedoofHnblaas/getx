import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/widget/home/search/darasearch.dart';

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
            height: Get.height * 0.07,
            width: Get.width * 0.9,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Get.theme.shadowColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                      child: Text(
                    'E-commerce App',
                    style:
                        Get.textTheme.headline1!.copyWith(fontFamily: 'Combo'),
                  )),
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
                        color: Get.theme.primaryColor,
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
