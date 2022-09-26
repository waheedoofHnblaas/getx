import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/homecontroller.dart';
import 'package:getx/controller/home/searchcontroller.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:getx/core/constant/approutes.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/view/widget/home/search/datasearch.dart';
import 'package:getx/view/widget/home/settinghomewidget.dart';
import 'package:getx/view/widget/home/settingpage/rowtile.dart';
import 'package:getx/view/widget/home/settingpage/settingrow.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget(
      {Key? key, this.title = 'E-commerce App', this.showback = false})
      : super(key: key);

  late String title;
  late bool showback;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    MyLocalController localController = Get.find();

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
                    onPressed: () async {
                      Get.defaultDialog(
                        title: 'Setting',
                        titleStyle: Get.textTheme.headline1,
                        backgroundColor: Get.theme.backgroundColor,
                        content: const SettingHomeWidget(),
                      );
                    },
                    icon: const Icon(Icons.menu)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
