import 'dart:convert';

import 'package:data_mangr/views/auth/presentation/registration/email_verificationPage.dart';
import 'package:data_mangr/views/global_widget/page_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';

import '../../../../controller/authentication_controller.dart';
import '../../../../data/client/app_response.dart';
import '../../../../data/client/result.dart';
import '../../../../route/routes.dart';
import '../model/model/registration_request_model.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/sansRegular.dart';
import '../../../global_widget/custom_text_field.dart';
import '../../../global_widget/rounded_button.dart';
import '../../../global_widget/validation_mixin.dart';

class RegistrationPage extends GetView<AuthenticationController>  {
   RegistrationPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final confirmPasswordController = TextEditingController();
   final firstNameController = TextEditingController();
   final lastNameController = TextEditingController();
   final phoneNumberController = TextEditingController();
   final dobController = TextEditingController();
   final orgTypeController = TextEditingController();
   final organisationNameController = TextEditingController();

   Future<void> _handleRegistration() async {
     final isValid = _formKey.currentState?.validate() ?? false;

     if (isValid) {
       var email = emailController.text.trim();
       var password = passwordController.text.trim();
       var firstName = firstNameController.text.trim();
       var lastName = lastNameController.text.trim();
       var phoneNumber = phoneNumberController.text.trim();
       var confirmPassword = confirmPasswordController.text.trim();
       var dob = dobController.text.trim();
        var uuid = Uuid();
        print(uuid.v4());
       
       var createRequest = RegistrationRequest(
           first_name: firstName,
           last_name: lastName,
           phone_number: phoneNumber,
           email: email,
           password: password,
           organisation_name: organisationNameController.text.toString(),
           username: "TP@$firstName-${organisationNameController.text.toString()}",
           organisation_type: orgTypeController.text.toString(),
         organisation_id: "DMORG-${uuid.v4()}");

       var result = await controller.registerUser(createRequest);

       final appResponse = AppResponse.fromJson(result);
      
       if ( appResponse.success) {
         print(result['data']['id']);
         // var resdata = jsonDecode(result);
         // print(resdata.toString());
         Get.to(() => EmailVerificationPage(
           email: email,
           regisData: result ,
         
         ));


       } else {
         Get.snackbar('Error ', (result as Failure).message,
             backgroundColor: CustomColors().appBackgroundColor,colorText: Colors.white);
         return;
       }

       print(result);
     }
   }


   @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeaderWidget(svgLink: "assets/svg/nav_icon.svg", press: (){
                Get.toNamed(Routes.login);
              },),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(height: 0,),
                          Text("Create your account",
                              style: sansRegular(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  lineHeight: 1.5,
                                  fontColor: Colors.black)),

                          Text("Kindly provide the following details to get started",

                              style: sansRegular(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  lineHeight: 1.5,
                                  fontColor: CustomColors().subTitleColor)),
                          SizedBox(height: 10,),
                          InputField(
                            labelText: "Richard",
                            label: 'First Name',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {
                              if(value.length > 4){
                                // var result =  ValidationMixin().validateEmail(value);

                                if (passwordController.text.isNotEmpty&&
                                    phoneNumberController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }
                            },
                            isEmail: false,
                            isPhoneNumber: false,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:firstNameController,
                          ),

                          SizedBox(height: 10,),
                          InputField(
                            labelText: "Johnson",
                            label: 'Last Name',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {

                              if(value.length > 3){


                                if (passwordController.text.isNotEmpty && firstNameController.text.isNotEmpty &&
                                   phoneNumberController.text.isNotEmpty  &&
                                    emailController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }

                            },
                            isEmail: false,
                            isPhoneNumber: false,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:lastNameController,
                          ),
                          SizedBox(height: 10,),
                          InputField(
                            labelText: "+234......",
                            label: 'Phone Number',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {

                              if(value.length > 10){
                                var result =  ValidationMixin().validatePhonenumber(value);

                                if (passwordController.text.isNotEmpty && firstNameController.text.isNotEmpty && result!=null &&
                                    emailController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }

                            },
                            isEmail: false,
                            isPhoneNumber: true,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:phoneNumberController,
                          ),
                          SizedBox(height: 10,),
                          InputField(
                            labelText: "jd@gmail.com",
                            label: 'Email Address',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {

                              if(value.length > 3){
                                var result =  ValidationMixin().validateEmail(value);

                                if (passwordController.text.isNotEmpty && firstNameController.text.isNotEmpty &&
                                    phoneNumberController.text.isNotEmpty && result !=null &&
                                    lastNameController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }
                            },
                            isEmail: true,
                            isPhoneNumber: false,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:emailController,
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                            labelText: "Password",
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {
                              if(value.length > 5){
                                var result =  ValidationMixin().validatePassword(value);

                                if (emailController.text.isNotEmpty && firstNameController.text.isNotEmpty &&
                                    phoneNumberController.text.isNotEmpty && result !=null &&
                                    lastNameController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }
                            },
                            isEmail: false,
                            isPhoneNumber: false,
                            isPassword: true,
                            isEnableOutLineBoarder: true,
                            label: "Password",
                            editingController: passwordController,
                          ),
                          SizedBox(height: 10,),
                          InputField(
                            labelText: "",
                            label: 'Organisation Name',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {

                              if(value.length > 5){
                                // var result =  ValidationMixin().validatePassword(value);

                                if (emailController.text.isNotEmpty
                                    && firstNameController.text.isNotEmpty &&
                                   phoneNumberController.text.isNotEmpty
                                    && passwordController.text.isNotEmpty &&
                                    lastNameController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }
                            },
                            isEmail: false,
                            isPhoneNumber: false,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:organisationNameController,
                          ),
                          SizedBox(height: 10,),
                          InputField(
                            labelText: "",
                            label: 'Organisation Type',
                            textInputAction: TextInputAction.next,
                            onChanged: (String value) {

                              if(value.length > 5){
                                // var result =  ValidationMixin().validatePassword(value);

                                if (emailController.text.isNotEmpty
                                    && firstNameController.text.isNotEmpty &&
                                   phoneNumberController.text.isNotEmpty
                                    && passwordController.text.isNotEmpty&&
                                    lastNameController.text.isNotEmpty
                                    && organisationNameController.text.isNotEmpty
                                    && orgTypeController.text.isNotEmpty ) {
                                  controller.isButtonActive.value = true;
                                }else{
                                  controller.isButtonActive.value = false;
                                }
                              } else {
                                controller.isButtonActive.value = false;
                              }
                            },
                            isEmail: false,
                            isPhoneNumber: false,
                            isPassword: false,
                            isEnableOutLineBoarder: true,
                            editingController:orgTypeController,
                          ),


                        ],
                      )),),
              ),
            ],
          ),
        ),),
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
              text: 'Continue',
              press: () {
                if(controller.isButtonActive.value){
                  _handleRegistration();
                }

                // Get.to(()=>EmailVerificationPage());
                // Get.toNamed(Routes.registration);
                // Get.toNamed(Routes.view_use_terms_condition);
              },
              textColor: Colors.white,
              color: controller.isButtonActive.value? CustomColors().activeButColor:CustomColors().inActiveButTextColor,
              isButtonFilledColor: true,
              buttonWidth: 4,
              marginVertical: 0,

              isLoading: controller.isLoading.value,
              isButtonDisabled: !controller.isButtonActive.value,
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.login);

              },
              child: RichText(text: TextSpan(text: "Got an account? ",style: sansRegular(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  lineHeight: 1.5,
                  fontColor: CustomColors().subTitleColor),
                  children: [ TextSpan(text: "Sign in",
                      style: sansRegular(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          lineHeight: 1.5,
                          fontColor: CustomColors().primaryColor))])),
            ),
            const SizedBox(height:40),
          ],
        ),
      ),));
  }
}
