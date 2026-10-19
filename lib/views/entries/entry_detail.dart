import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../global_widget/page_header_widget.dart';

class EntryDetail extends StatelessWidget {
  const EntryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PageHeaderWidget(
              svgLink: "assets/svg/avatar_icon.svg",
              title: "Entry Details",
            ),
          ),
          CircleAvatar(
            radius: 20,
            child:  Image.asset(
              'assets/images/reward_banner.png',


            ),
          ),
          Stack(children: [

            
            // Container(decoration:BoxDecoration(color: ) ,),

          ],)
        ],),
    )),);
  }
}
