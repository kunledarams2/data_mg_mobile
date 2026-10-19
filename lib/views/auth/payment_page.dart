import 'package:data_mangr/views/auth/presentation/model/model/subscription_plan_response.dart';
import 'package:data_mangr/views/auth/presentation/registration/reg_success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/page_header_widget.dart';
import '../global_widget/rounded_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key, required this.regisData, required this.subscriptionPlan}) : super(key: key);
  final dynamic regisData;
 final SubscriptionPlan subscriptionPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeaderWidget(svgLink: 'assets/svg/nav_icon.svg'),
              Text("Enter payment details",
                  style: sansRegular(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      lineHeight: 1.5,
                      fontColor: Colors.black)),

              Text("Kindly provide the following details to continue",

                  style: sansRegular(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      lineHeight: 1.5,
                      fontColor: CustomColors().subTitleColor)),
              SizedBox(height: 20,),

              InputField(
                labelText: "2222******22",
                label: 'Card Number',
                textInputAction: TextInputAction.next,
                onChanged: (String value) {

                },
                isEmail: false,
                isPhoneNumber: false,
                isPassword: false,
                isEnableOutLineBoarder: true,
                // editingController:firstNameController,
              ),

              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                Expanded(
                  
                  child: InputField(
                    labelText: "MM/YY",
                    label: 'Expiry',
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {

                    },
                    isEmail: false,
                    isPhoneNumber: false,
                    isPassword: false,
                    isEnableOutLineBoarder: true,
                    // editingController:lastNameController,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: InputField(
                    labelText: "*****",
                    label: 'CVV',
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {

                    },
                    isEmail: false,
                    isPhoneNumber: true,
                    isPassword: false,
                    isEnableOutLineBoarder: true,
                    // editingController:phoneNumberController,
                  ),
                ),
              ],),
              SizedBox(height: 20,),
              RoundedButton(
                text: 'Continue',
                press: () {

                  Get.to(()=>RegSuccessPage());
                },
                textColor: Colors.white,
                color: CustomColors().primaryColor,
                isButtonFilledColor: true,
                buttonWidth: 4,
                marginVertical: 0,
              ),



            ],
          ),
        ),
      ),
    );
  }
}
