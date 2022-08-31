import 'package:flutter/material.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/checkinternet.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/core/localization/translation.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/initialbinding.dart';
import 'package:getx/routes.dart';
import 'package:getx/view/screen/auth/login.dart';
import 'package:getx/view/screen/language.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController localcontroller = Get.put(MyLocalController());
    return GetMaterialApp(
        locale: localcontroller.language,
        translations: MyTranslations(),
        getPages: routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.back,
          ),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  fontSize: 24,
                  color: AppColors.black),
              bodyText1: TextStyle(
                  height: 2, color: AppColors.gray, fontFamily: 'Cairo'),
              subtitle1: TextStyle(
                  height: 2, color: AppColors.back, fontFamily: 'Cairo')),
        ),
      initialBinding: InitialBinding(),
        );
  }
}
