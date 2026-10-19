

import 'package:data_mangr/theme/sansRegular.dart';
import 'package:data_mangr/views/tabs/enteriesPage.dart';
import 'package:data_mangr/views/tabs/settingsPage.dart';
import 'package:data_mangr/views/tabs/templatePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';


import '../model/TabHostModel.dart';
import '../theme/app_theme.dart';
import '../views/tabs/homePage.dart';

class TabHostController  extends GetxController with GetTickerProviderStateMixin {

  late TabController tabController;
  Rx<int> selectedTabIndex = 0.obs;
  List<Widget> tabList = [];
  RxBool showBottomTab = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getTabs();
    tabController = TabController( initialIndex: selectedTabIndex.value,
        length: tabList.length, vsync: this, animationDuration: Duration.zero);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    if(selectedTabIndex.value == 2){
      showBottomTab.value = false;
    }
  }


  // RxBool to track whether loading is in progress
  RxBool isLoading = false.obs;

  // Method to show the loading dialog
  void showLoadingDialog(String content ) {
    isLoading.value = true;
    Get.dialog(
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: Get.size.width,
            padding: EdgeInsets.all(16),
            // color: Colors.white,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/bloc_loader.gif', width: 102,height: 102,),
                SizedBox(height: 0,),

                Text(content,
                  style: sansRegular(
                      fontColor: Color(0xFF232324),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      lineHeight: 1.5),
                ),
                SizedBox(height: 20,),



              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Method to hide the loading dialog
  void hideLoadingDialog() {
    isLoading.value = false;
    Get.back();
  }

  void hideTabs(bool isHide){

  }


  Rx<TabHostModel> selectedTab = TabHostModel(page:  HomePage(), selectedIconUrl: 'assets/icons/home_icon.svg', unselectedIconUrl: 'assets/icons/more_icon.svg', tabName: 'Home').obs;



  List<TabHostModel>dashBoardTabsData=[
    TabHostModel(page:  HomePage()
        , tabName: "Home", selectedIconUrl: 'assets/svg/selected_home_icon.svg', unselectedIconUrl: 'assets/svg/unselected_home_icon.svg'),
    TabHostModel(page:   EntriesPage()
    , tabName: "Entries",selectedIconUrl: 'assets/svg/selected_entries_icon.svg', unselectedIconUrl: 'assets/svg/unselected_entries_icon.svg'),
    TabHostModel(page:  const TemplatePage()
        , tabName: "Templates",selectedIconUrl: 'assets/svg/selected_template_icon.svg', unselectedIconUrl: 'assets/svg/unselected_template_icon.svg'),
    TabHostModel(page: const SettingsPage()
        ,  tabName: "Settings",selectedIconUrl: 'assets/svg/selected_setting_icon.svg', unselectedIconUrl: 'assets/svg/unselected_setting_icon.svg'),
  ].obs;

}