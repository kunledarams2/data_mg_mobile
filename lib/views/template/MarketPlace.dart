import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../global_widget/page_header_widget.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
      children: [
        PageHeaderWidget(
          svgLink: "assets/svg/nav_icon.svg",
          title: "Theme Marketplace",
          press:(){Get.back();},
        ),
      ],
    )),);
  }
}
