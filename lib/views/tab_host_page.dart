import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../controller/tab_host_controller.dart';
import 'customize_bottom_nav_bar.dart';

class TabHostPage extends HookWidget {
  TabHostPage({Key? key}) : super(key: key);

  final TabHostController _tabHostController = Get.find();


  @override
  Widget build(BuildContext context) {

    final animationController = useAnimationController(
      duration: const Duration(seconds: 4),
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Color(0xFFFFFFFF),
          // systemNavigationBarContrastEnforced: false,
          // systemStatusBarContrastEnforced: false,
        ),
        child: WillPopScope(
            child: Obx(() => Scaffold(
              body:_tabHostController.selectedTab.value.page,

              bottomNavigationBar:CustomBottomNavigationBar(),
            )),
            onWillPop: () {
              return Future.value(false);
            }));
  }
}