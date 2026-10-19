import 'package:data_mangr/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/sansRegular.dart';

class PageHeaderWidget extends StatelessWidget {
   PageHeaderWidget({Key? key, required this.svgLink, this.title, this.press, this.tailSvgLink, this.tailPress, this.includeHorizontalPadding=false }) : super(key: key);
  String? title;
  String svgLink;
  String? tailSvgLink;
  final Function()? tailPress;
  final Function()? press;
  bool includeHorizontalPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: Get.size.width,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: includeHorizontalPadding?16:0),
        child: Row(children: [
          GestureDetector(
            onTap: press,
            child: Container(height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0XFFF2F2F2),),
              child: SvgPicture.asset(svgLink, height: 15,width: 15,fit: BoxFit.scaleDown),
            ),
          ),
         Spacer(),
         title !=null? Text(title??"",
             style: sansRegular(
                 fontWeight: FontWeight.w600,
                 fontSize: 18,
                 lineHeight: 1.5,
                 fontColor: CustomColors().primaryColor)):SizedBox.shrink(),
          Spacer(),
          tailSvgLink !=null?
          GestureDetector(
            onTap: tailPress,
            child: Container(height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0XFFF2F2F2),),
              child: SvgPicture.asset(tailSvgLink??"", height: 15,width: 15,fit: BoxFit.scaleDown),
            ),
          ):SizedBox.shrink(),
        ],),
      ),
       );
  }
}
