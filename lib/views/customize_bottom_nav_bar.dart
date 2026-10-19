


import 'package:data_mangr/theme/sansRegular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../controller/tab_host_controller.dart';
import '../model/TabHostModel.dart';
import '../theme/app_theme.dart';


class CustomBottomNavigationBar extends GetView<TabHostController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() => Container(
      height: Get.height * 0.10,
      width: Get.size.width,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0xFFADD4F3),
            blurRadius: 5.0,
            offset: Offset(0, 3))
      ]),
      child: ListView.builder(itemBuilder: (context,index){
        return CustomNavigationBarItem(
            isSelected: controller.selectedTab.value.tabName==controller.dashBoardTabsData[index].tabName,
            dashBoardTabModel:controller.dashBoardTabsData[index],
            onTap: (tabData){
              controller.selectedTab.value=tabData;
            });
      },
        itemCount: controller.dashBoardTabsData.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,),
    ));
  }
}

class CustomNavigationBarItem extends HookWidget {
  const CustomNavigationBarItem(
      {super.key,
        required this.isSelected,
        required this.onTap,
        required this.dashBoardTabModel});

  final bool isSelected;
  final Function(TabHostModel) onTap;
  final TabHostModel dashBoardTabModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(dashBoardTabModel);
      },
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          width: 80,
          // color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(isSelected? dashBoardTabModel.selectedIconUrl:dashBoardTabModel.unselectedIconUrl,
                  height: 25,
                  width: 25,

                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(dashBoardTabModel.tabName,
                      textAlign: TextAlign.center,
                      style: sansRegular(
                          fontColor: isSelected
                              ? Color(0xFF030303)
                              : Get.isDarkMode
                              ? CustomColors().primaryColor
                              : Colors.grey,
                          fontSize: 11,
                          fontWeight:isSelected?  FontWeight.w500:FontWeight.w400

                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}