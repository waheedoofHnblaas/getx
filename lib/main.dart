import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:getx/core/constant/colors.dart';
import 'package:getx/core/function/checkinternet.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/core/localization/translation.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/initialbinding.dart';
import 'package:getx/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: true,
  ));
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
        appBarTheme: AppBarTheme(
          toolbarHeight: Get.height * 0.06,
          iconTheme: const IconThemeData(
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
            bodyText2: TextStyle(
              height: 2,
              color: AppColors.primary,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
                height: 2, color: AppColors.back, fontFamily: 'Cairo')),
      ),
      initialBinding: InitialBinding(),
    );
  }
}
