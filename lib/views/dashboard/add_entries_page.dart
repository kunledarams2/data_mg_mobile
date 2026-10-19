import 'package:data_mangr/views/tabs/enteriesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart';
import '../../utils/bottomSheetSelect.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/page_header_widget.dart';
import '../global_widget/rounded_button.dart';

class AddEntries extends HookWidget {
  const AddEntries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    useEffect((){
      // _entriesMethod(context);
    },[]);


    return Scaffold(
      backgroundColor:  Color(0XFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeaderWidget(
                svgLink: "assets/svg/nav_icon.svg",
                title: "Add new entry",
                includeHorizontalPadding: true,
                press: ()=>Get.back(),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Photo",
                                style: sansRegular(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    lineHeight: 1.5,
                                    fontColor: Color(0XFFB2B2B2))),
                            Stack(
                              children: [
                                // SizedBox(width: Get.size.width,),
                                Container(
                                  height: 120,
                                  width: 120,
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0XFFB2B2B2)),
                                    child: SvgPicture.asset(
                                      "assets/svg/avatar_icon.svg",
                                      color: Colors.white,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 80,
                                    left: 75,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: SvgPicture.asset(
                                        "assets/svg/camera_icon.svg",
                                        color: Colors.black,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Form(
                        // key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              SizedBox(height: 10,),
                              InputField(
                                labelText: "Richard",
                                label: 'First Name',
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
                                isEmail: false,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                // editingController:emailController,
                              ),

                              SizedBox(height: 10,),
                              InputField(
                                labelText: "Johnson",
                                label: 'Last Name',
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
                                isEmail: false,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                // editingController:emailController,
                              ),
                              SizedBox(height: 10,),

                              BottomSheetSelect(
                                title: "Gender",
                                items:  ["Male", "Female"],
                                value: "Male",
                                onChanged: (val) {

                                }, labelText: 'Gender',
                                isEnableOutLineBoarder: true,

                              ),

                              SizedBox(height: 10,),
                              InputField(
                                labelText: "+234....",
                                label: 'Phone number',
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
                                isEmail: false,
                                isPhoneNumber: true,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                // editingController:emailController,
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                labelText: "we...@gmail.com",
                                textInputAction: TextInputAction.next,
                                onChanged: (String value) {
                                  /* if(value.length>1 && passwordController.text.isNotEmpty){
                                      controller.isButtonActive.value = true;
                                    }else{
                                      controller.isButtonActive.value = false;
                                    }*/
                                },
                                isEmail: true,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                label: "Email address",
                                // editingController: passwordController,
                              ),
                              SizedBox(height: 10,),
                              InputField(
                                labelText: "",
                                label: 'Date of Birth',
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
                                isEmail: false,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                isDateField: true,
                                suffixIcon: Icon(Icons.calendar_today),

                                // editingController:emailController,
                              ),
                              SizedBox(height: 10,),
                              InputField(
                                labelText: "",
                                label: 'Occupation',
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
                                isEmail: false,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                // editingController:emailController,
                              ),
                              SizedBox(height: 10,),
                              BottomSheetSelect(
                                title: "Martial Status",
                                items:  ["Married", "Single","Divorce"],
                                value: "Married",
                                onChanged: (val) {

                                }, labelText: 'Martial Status',
                                isEnableOutLineBoarder: true,

                              ),
                              SizedBox(height: 10,),
                              InputField(
                                labelText: "",
                                label: 'Wedding date',
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
                                isEmail: false,
                                isPhoneNumber: false,
                                isPassword: false,
                                isEnableOutLineBoarder: true,
                                isDateField: true,
                                suffixIcon: Icon(Icons.calendar_today),
                                // editingController:emailController,
                              ),
                              SizedBox(height: 40,),
                              RoundedButton(
                                text: 'Save',
                                press: () {

                                },
                                textColor: Colors.white,
                                color: CustomColors().primaryColor,
                                isButtonFilledColor: true,
                                buttonWidth: 4,
                                marginVertical: 0,
                              ),
                              SizedBox(height: 40,),


                            ],
                          )),
                      // _entriesMethod(context),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future  _entriesMethod( BuildContext context) {
    return Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 5,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("How much do you want to Contribute?",
                    style: sansRegular(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontColor: Colors.black)),
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ));
  }

}
