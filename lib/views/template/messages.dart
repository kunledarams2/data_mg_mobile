import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/rounded_button.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
      children: [
        SizedBox(height: 20,),
        RoundedButton(
          text: 'Add new entry',
          press: () {},
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
