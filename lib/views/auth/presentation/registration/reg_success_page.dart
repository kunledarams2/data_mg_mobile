import 'package:data_mangr/views/auth/presentation/login/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/sansRegular.dart';
import '../../../global_widget/rounded_button.dart';
import '../../../tab_host_page.dart';

class RegSuccessPage extends StatelessWidget {
  const RegSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/check_circle.svg"),
              SizedBox(height: 20,),
              Text("All done",
                  style: sansRegular(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      lineHeight: 1.5,
                      fontColor: Colors.black)),
              SizedBox(height: 5,),

              Text("Your account setup is complete",

                  style: sansRegular(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      lineHeight: 1.5,
                      fontColor: CustomColors().subTitleColor)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: Get.size.width * 0.042,
            right: Get.size.width * 0.042,
            bottom: Get.size.height * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:20),
            RoundedButton(
              text: 'Done',
              press: () {
                Get.to(()=>LoginPage());
                // Get.to(()=>EmailVerificationPage());
                // Get.toNamed(Routes.registration);
                // Get.toNamed(Routes.view_use_terms_condition);
              },
              textColor: Colors.white,
              color: CustomColors().primaryColor,
              isButtonFilledColor: true,
              buttonWidth: 4,
              marginVertical: 0,
            ),

            const SizedBox(height:40),
          ],
        ),
      ),
    );
  }
}
