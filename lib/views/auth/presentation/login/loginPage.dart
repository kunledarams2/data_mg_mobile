import 'package:data_mangr/controller/authentication_controller.dart';
import 'package:data_mangr/views/tab_host_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../route/routes.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/sansRegular.dart';
import '../../../global_widget/custom_text_field.dart';
import '../../../global_widget/rounded_button.dart';
import '../../../global_widget/validation_mixin.dart';

class LoginPage extends GetView<AuthenticationController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 80,),
                      Text("Log in to your account",
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
                      SizedBox(height: 10,),
                      InputField(
                        labelText: "Email Address",
                        label: 'Email Address',
                        textInputAction: TextInputAction.next,
                        onChanged: (String value) {
/*
                          if(value.length > 1){
                            var result =  ValidationMixin().validateEmail(value);

                            if (passwordController.text.isNotEmpty && result ==null ) {
                              controller.isButtonActive.value = true;
                            }else{
                              controller.isButtonActive.value = false;
                            }
                          } else {
                            controller.isButtonActive.value = false;
                          }*/
                        },
                        isEmail: true,
                        isPhoneNumber: false,
                        isPassword: false,
                        isEnableOutLineBoarder: true,
                        // editingController:emailController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InputField(
                        labelText: "Password",
                        textInputAction: TextInputAction.next,
                        onChanged: (String value) {
                         /* if(value.length>1 && passwordController.text.isNotEmpty){
                            controller.isButtonActive.value = true;
                          }else{
                            controller.isButtonActive.value = false;
                          }*/
                        },
                        isEmail: false,
                        isPhoneNumber: false,
                        isPassword: true,
                        isEnableOutLineBoarder: true,
                        label: "Password",
                        // editingController: passwordController,
                      ),
                      SizedBox(height: 10,),

                      Text("Forgot password?",

                          style: sansRegular(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              lineHeight: 1.5,
                              fontColor: CustomColors().primaryColor)),
                      SizedBox(height: 10,),

                      RoundedButton(
                        text: 'Log in',
                        press: () {

                          Get.to(()=>TabHostPage());
                          // Get.toNamed(Routes.registration);
                          // Get.toNamed(Routes.view_use_terms_condition);
                        },
                        textColor: Colors.white,
                        color: CustomColors().primaryColor,
                        isButtonFilledColor: true,
                        buttonWidth: 4,
                        marginVertical: 0,
                      ),
                      InkWell(
                        onTap: (){

                          Get.toNamed(Routes.registration);
                        },
                        child: RichText(text: TextSpan(text: "Don’t have an account? ",style: sansRegular(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            lineHeight: 1.5,
                            fontColor: CustomColors().subTitleColor),
                            children: [ TextSpan(text: "Sign up",
                                style: sansRegular(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    lineHeight: 1.5,
                                    fontColor: CustomColors().primaryColor))])),
                      )
                    ],
                  )),
            ],

    ),
        ),),),);
  }
}
