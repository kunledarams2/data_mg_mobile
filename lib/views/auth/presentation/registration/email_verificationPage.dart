import 'dart:convert';

import 'package:data_mangr/controller/authentication_controller.dart';
import 'package:data_mangr/views/auth/presentation/registration/reg_success_page.dart';
import 'package:data_mangr/views/auth/subscription_list_page.dart';
import 'package:data_mangr/views/global_widget/page_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/sansRegular.dart';

class EmailVerificationPage extends GetView<AuthenticationController> {
   EmailVerificationPage({Key? key, required this.email, required this.regisData}) : super(key: key);
   final String email;
   final dynamic regisData;

  final List<TextEditingController> pinControllers = List.generate(6, (_) => TextEditingController());

   Future<void> _handleEmailVerification(otp) async {
     // final isValid = _formKey.currentState?.validate() ?? false;


     print(otp);
     var result = await controller.verifyRegEmail(otp);
     // var objResult = jsonEncode(result);
     var jResponse = jsonDecode(result.toString());
     if (jResponse['success']) {
       controller.fetchSubscriptionPlan();
       Get.to(()=>SubscriptionListPage( regisData: regisData,));

     }else{

       Get.snackbar('', jResponse["message"]);
       return;

     }


   }


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
              Text("Verify your email address",
                  style: sansRegular(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      lineHeight: 1.5,
                      fontColor: Colors.black)),

              Text("Enter verification code sent to you",

                  style: sansRegular(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      lineHeight: 1.5,
                      fontColor: CustomColors().subTitleColor)),
              SizedBox(height: 20,),

              buildPinForm(context),
              SizedBox(height: 16,),
              Text("Didn’t receive code?",
                  style: sansRegular(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      lineHeight: 1.5,
                      fontColor: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinForm(BuildContext context) {
    return Form(
      child: Row(
        children: List.generate(
          pinControllers.length,
              (index) => buildPinInputField(index, context),
        ),
      ),
    );
  }

  Widget buildPinInputField(int index, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextFormField(
          cursorColor: CustomColors().primaryColor,
          textAlignVertical: TextAlignVertical.center,
          obscureText:true,
          style: sansRegular(
            fontColor: Get.isDarkMode ? CustomColors().darkModePrimaryColor : Color(0xFF232324),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: '',
            isDense: true,
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors().primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              if(index !=5){
                FocusScope.of(context).nextFocus();
                // controller.regButtonActive.value = true;
              }else{
                var pin = pinControllers.map((controller) => controller.text).join();
                _handleEmailVerification(pin);

              }

            }else if(value.isEmpty){
              FocusScope.of(context).previousFocus();
              // controller.regButtonActive.value = true;

            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: pinControllers[index],
        ),
      ),
    );
  }
}
