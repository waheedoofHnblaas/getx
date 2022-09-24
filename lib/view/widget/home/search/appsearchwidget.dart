import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/searchcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/view/widget/home/search/datasearch.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget(
      {Key? key, this.title = 'E-commerce App', this.showback = false})
      : super(key: key);

  late String title;
  late bool showback;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    SearchController searchController = Get.put(SearchController());
    return GetBuilder<ThemeController>(
      builder: (controller) => SizedBox(
        width: Get.width * 0.9,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppThemes().getCurrentTheme().shadowColor,
                ),
                child: IconButton(
                  onPressed: () {
                    if (showback) {
                      Get.back();
                    } else {
                      showSearch(
                        context: context,
                        delegate: DataSearch(),
                      );
                    }
                  },
                  icon: Icon(
                    showback ? CupertinoIcons.back : CupertinoIcons.search,
                    color: AppThemes().getCurrentTheme().primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                  child: Text(
                title,
                style: AppThemes()
                    .getCurrentTheme()
                    .textTheme
                    .headline1!
                    .copyWith(fontFamily: 'Combo', fontSize: 28),
              )),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppThemes().getCurrentTheme().shadowColor,
                ),
                child: IconButton(
                    color: AppThemes().getCurrentTheme().primaryColor,
                    onPressed: () async{
                      homeController.changePage(0);
                     await homeController.getHomeData();
                    },
                    icon: const Icon(Icons.update)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
