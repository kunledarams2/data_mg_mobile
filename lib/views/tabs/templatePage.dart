import 'package:data_mangr/views/template/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/page_header_widget.dart';
import '../global_widget/rounded_button.dart';
import '../template/Themes.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              PageHeaderWidget(
                svgLink: "assets/svg/avatar_icon.svg",
                title: "Entries",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:   DefaultTabController(
                        length: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.size.width,
                                height: 50,
                                decoration: const BoxDecoration(
                                  // shape: BoxShape.rectangle,
                                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                                  border: Border(bottom: BorderSide(color:Color(0xffE4E5EB) )),
                                  // color: Color(0xffE4E5EB)
                                ),
                                child: _buildTabBar(),
                              ),
                              SizedBox(
                                height: Get.size.height *0.75 ,
                                child:  TabBarView(
                                    children: [
                                      Message(),
                                      Themes()
                                      // CashOutflow()
                                    ]),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(
          icon: Text(
            'Messages',
            style: sansRegular(
                fontSize: 16,
                fontColor: const Color(0xFF111217),
                fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          icon: Text(
            'Themes',
            style: sansRegular(
                fontSize: 16,
                fontColor: const Color(0xFF111217),
                fontWeight: FontWeight.w600),
          ),
        ),

      ],
      indicatorColor: const Color(0xFF111217),
      indicator: const BoxDecoration(
        // shape: BoxShape.rectangle,
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border(bottom: BorderSide(color: Colors.black)),
        // color: Colors.white
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(0),
      unselectedLabelColor: Colors.grey,
    );
  }
}
