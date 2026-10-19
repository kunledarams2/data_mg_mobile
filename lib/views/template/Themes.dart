import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/rounded_button.dart';
import 'MarketPlace.dart';

class Themes extends StatelessWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
      children: [
        SizedBox(height: 20,),
        RoundedButton(
          text: 'Add new theme',
          press: () {
            Get.to(()=>MarketPlace());
          },
          textColor: Colors.white,
          color: CustomColors().primaryColor,
          isButtonFilledColor: true,
          buttonWidth: 4,
          marginVertical: 0,
        ),
        InputField(
          labelText: "Search",
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
          isPassword: false,
          isEnableOutLineBoarder: true,

          label: "",
          // editingController: passwordController,
        ),
      ],
    ),),);
  }
}
