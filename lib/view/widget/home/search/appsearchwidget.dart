import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home/searchcontroller.dart';
import 'package:getx/view/widget/home/search/datasearch.dart';

class AppSearchWidget extends StatelessWidget {
  AppSearchWidget({Key? key, this.title = 'E-commerce App'}) : super(key: key);

  late String title;
  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(SearchController());
    return GetBuilder<SearchController>(
      builder: (searchController) => WillPopScope(
        onWillPop: () async {
          return searchController.onBack(context);
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
                        showSearch(
                          context: context,
                          delegate: DataSearch(),
                        );
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
                    title,
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
        ),
      ),
    );
  }
}
