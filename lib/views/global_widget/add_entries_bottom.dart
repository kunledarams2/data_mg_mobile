

import 'package:data_mangr/views/global_widget/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart';
import '../dashboard/add_entries_page.dart';

 Future  entriesMethod( BuildContext context) {
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

            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text("Add new entry",
                    style: sansRegular(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontColor: Colors.black)),
                Spacer(),
                IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.close_rounded))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("Select preferred upload method",
                style: sansRegular(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontColor: Colors.black)),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              text: 'Manual entry',
              press: () {
                // _entriesMethod(context);
                Get.back();
                Get.to(()=>AddEntries());
                // Get.back();
                // Get.toNamed(Routes.registration);
                // Get.toNamed(Routes.view_use_terms_condition);

              },
              textColor: Colors.white,
              color: CustomColors().primaryColor,
              isButtonFilledColor: true,
              buttonWidth: 4,
              marginVertical: 0,
            ),
            RoundedButton(
              text: 'Group upload',
              press: () {
                // _entriesMethod(context);
                // Get.to(()=>AddEntries());
                // Get.toNamed(Routes.registration);
                // Get.toNamed(Routes.view_use_terms_condition);
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
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ));
}