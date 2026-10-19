import 'package:data_mangr/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../route/routes.dart';
import '../theme/sansRegular.dart';
import 'auth/DemoProductCard.dart';
import 'global_widget/rounded_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         SizedBox(height: 80,),
        // SvgPicture.asset("assets/svg/landing_image.svg", color: Colors.black,)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset("assets/images/landing_image.png"),
        ),
        Text("Organize your data with ease",
            style: sansRegular(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                lineHeight: 1.5,
                fontColor: CustomColors().primaryColor)),
        // SizedBox(height: 10,),
        Text("Categorise, filter, and tag for quick and efficient \naccess",
            textAlign: TextAlign.center,
            style: sansRegular(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                lineHeight: 1.5,
                fontColor: CustomColors().subTitleColor))
      ],)),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.only(
          left: Get.size.width * 0.042,
          right: Get.size.width * 0.042,
          bottom: Get.size.height * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoundedButton(
                text: 'Log in',
                press: () {
                  Get.toNamed(Routes.login);
                  // Get.toNamed(Routes.view_use_terms_condition);
                  // Get.to(()=>ProductCatalogue());
                },
                textColor: CustomColors().primaryColor,
                color: CustomColors().inActiveButColor,
                isButtonFilledColor: true,
                buttonWidth: 0.42,marginVertical: 0,
              ),
              const SizedBox(width: 20),
              RoundedButton(
                text: 'Get Started',
                press: () {
                  Get.toNamed(Routes.registration);
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
          const SizedBox(height:40),
        ],
      ),
    ),);
  }
}
