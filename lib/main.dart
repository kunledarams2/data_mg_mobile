import 'package:data_mangr/route/pages.dart';
import 'package:data_mangr/route/routes.dart';
import 'package:data_mangr/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/core_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: GetMaterialApp(
        title: 'DataMangr.',
        debugShowCheckedModeBanner: false,

        theme: CustomColors().themeData,

        initialRoute: Routes.landingPage,
        getPages: Pages.routes,
        initialBinding: CoreBinding(),

      ),
    );
  }
}


