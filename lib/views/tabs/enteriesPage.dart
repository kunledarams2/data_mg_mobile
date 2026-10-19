import 'package:data_mangr/theme/sansRegular.dart';
import 'package:data_mangr/views/entries/entry_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../global_widget/add_entries_bottom.dart';
import '../global_widget/custom_text_field.dart';
import '../global_widget/page_header_widget.dart';
import '../global_widget/rounded_button.dart';

class EntriesPage extends StatelessWidget {
  const EntriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                    children: [
            PageHeaderWidget(
              svgLink: "assets/svg/avatar_icon.svg",
              title: "Entries",
            ),
            Expanded(
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    RoundedButton(
                      text: 'Add new entry',
                      press: () {
                        entriesMethod(context);
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
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: ()=>Get.to(()=>EntryDetail()),
                      child: Container(
                        // padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:Border(top: BorderSide(color: Colors.grey), left:BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey), ),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Angela Uche",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontColor: Colors.black)),
                                  Spacer(),
                                  Text("0810784759",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontColor: Colors.black)),
                                ],),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Female",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontColor: Colors.black)),
                                  Spacer(),
                                  Text("Yussh@gmail.com",
                                      style: sansRegular(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontColor: Colors.black)),
                                ],),
                            ),
                            // Divider()

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
                    ],
                  ),
          )),
    );
  }
}


