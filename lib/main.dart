import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:getx/controller/themecontroller.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:getx/core/constant/themesdata/themes.dart';
import 'package:getx/core/localization/changelocal.dart';
import 'package:getx/core/localization/translation.dart';
import 'package:getx/core/services/services.dart';
import 'package:getx/initialbinding.dart';
import 'package:getx/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // runApp(const MyApp());
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
    return ThemeProvider(
      initTheme: AppThemes().getCurrentTheme(),
      builder: (_, theme) => GetMaterialApp(
        locale: localcontroller.language,
        translations: MyTranslations(),
        getPages: routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: theme,
        themeMode: AppThemes().getCurrentThemeMode(),
        initialBinding: InitialBinding(),
      ),
    );
  }
}
