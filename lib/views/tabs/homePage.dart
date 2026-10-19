import 'package:data_mangr/theme/app_theme.dart';
import 'package:data_mangr/views/dashboard/add_entries_page.dart';
import 'package:data_mangr/views/global_widget/page_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/sansRegular.dart';
import '../global_widget/add_entries_bottom.dart';
import '../global_widget/rounded_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Color(0xFFFFFFFF),
          // systemNavigationBarContrastEnforced: false,
          // systemStatusBarContrastEnforced: false,
        ),

     child: Scaffold(
      backgroundColor: Color(0XFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeaderWidget(
                svgLink: "assets/svg/avatar_icon.svg",
                title: "Home",
                includeHorizontalPadding: true,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: CustomColors().primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(height: 40,width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                          child: SvgPicture.asset("assets/svg/unselected_entries_icon.svg", fit: BoxFit.scaleDown, height: 8, width: 8,),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Total Entries",
                                style: sansRegular(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    lineHeight: 1.5,
                                    fontColor: Color(0XFFB2B2B2))),
                            Text("404",
                                style: sansRegular(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    lineHeight: 1.5,
                                    fontColor: Colors.white)),

                          ],),
                        ],),
                      ),),
                      SizedBox(height: 20,),

                      Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0XFFE5E5E5)),
                          color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 40,width: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColors().primaryColor,),
                                child: SvgPicture.asset("assets/svg/message_icon.svg", fit: BoxFit.scaleDown, height: 8, width: 8,),),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Messages",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          lineHeight: 1.5,
                                          fontColor: Color(0XFFB2B2B2))),
                                  Text("40",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          lineHeight: 1.5,

                                          fontColor: CustomColors().primaryColor)),

                                ],),
                            ],),
                        ),),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RoundedButton(
                            text: 'Send a message',
                            press: () {
                              // Get.toNamed(Routes.login);
                              // Get.toNamed(Routes.view_use_terms_condition);
                            },
                            textColor: CustomColors().primaryColor,
                            color: CustomColors().inActiveButColor,
                            isButtonFilledColor: true,
                            buttonWidth: 0.42,marginVertical: 0,
                          ),
                          const SizedBox(width: 20),
                          RoundedButton(
                            text: 'Add new entry',
                            press: () {
                              entriesMethod(context);
                              // Get.to(()=>AddEntries());
                              // Get.toNamed(Routes.registration);
                              // Get.toNamed(Routes.view_use_terms_condition);
                            },
                            textColor: Colors.white,
                            color: CustomColors().primaryColor,
                            isButtonFilledColor: true,
                            buttonWidth: 0.42,
                            marginVertical: 0,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Sent Messages",
                            style: sansRegular(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                lineHeight: 1.5,

                                fontColor: CustomColors().primaryColor)),
                        Spacer(),
                        Text("See All",
                            style: sansRegular(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                lineHeight: 1.5,

                                fontColor: CustomColors().primaryColor))
                      ],),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0XFFE5E5E5))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                        child: Text("Your sent messages will appear here", style: sansRegular(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            lineHeight: 1.5,

                            fontColor: CustomColors().subTitleColor)),
                      ),),

                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recent Entries",
                              style: sansRegular(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  lineHeight: 1.5,

                                  fontColor: CustomColors().primaryColor)),
                          Spacer(),
                          Text("See All",
                              style: sansRegular(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  lineHeight: 1.5,

                                  fontColor: CustomColors().primaryColor))
                        ],),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0XFFE5E5E5))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                          child: Text("Your added entries will appear here", style: sansRegular(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              lineHeight: 1.5,

                              fontColor: CustomColors().subTitleColor)),
                        ),)
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    ));
  }


}
