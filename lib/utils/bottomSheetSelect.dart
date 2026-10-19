
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../theme/app_theme.dart';
import '../theme/sansRegular.dart';

class BottomSheetSelect extends StatelessWidget {
   BottomSheetSelect({super.key, required this.items, required this.labelText, required this.isEnableOutLineBoarder,
    required this.value, required this.onChanged, this.fontFamily, this.title, this.subTitle  });

  final List<String> items;
  final String labelText;
  final  ValueChanged<String?> onChanged;
  final bool isEnableOutLineBoarder;
  String? value;
  String? selectedValue;
  String? fontFamily;
  String? title;
  String? subTitle;

   final FocusNode _focusNode = FocusNode();
   bool _focused = false;

  @override
  Widget build(BuildContext context) {
       return SafeArea(child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(labelText,
               style: sansRegular(
                   fontWeight: FontWeight.w500,
                   fontSize: 14.sp,
                   fontColor: Color(0xFF6A6C6E),

                 lineHeight: 1.5,)),
           SizedBox(height: 5.h,),
           InkWell(
             onTap: (){
               bottomItems(context);
               _focused = true;
             },
             child: AnimatedContainer(
               duration: Duration(milliseconds: 300),
               height: 55.h,

               width: MediaQuery.sizeOf(context).width,
               padding: EdgeInsets.symmetric(
                   horizontal: _focused ? 0.5 : 0, vertical: _focused ? 0.5 : 0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: _focused
                     ? CustomColors().primaryColor // Shadow color when focused
                     : Colors.white,
                 border: Border.all(color: _focused? CustomColors().primaryColor:  Color(0xffC4C4C4))

               ),
                 child: Padding(
                   padding:  EdgeInsets.symmetric(vertical: 15.h, horizontal: 10),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(value??"Select",
                      
                       textAlign: TextAlign.justify,
                         style: sansRegular(
                           fontSize: 16.sp,
                           fontWeight: FontWeight.w500
                         ),
                       ),
                       Spacer(),
                       Icon(Icons.arrow_drop_down_outlined)
                     ],
                   ),
                 ),
                 ),
           ),
         ],
       ));
  }


   Future bottomItems(BuildContext context) {
     return showModalBottomSheet(

         builder: (context) =>  Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               SizedBox(
                 height: 20.h,
               ),
               Center(
                 child: InkWell(
                   onTap: () =>Navigator.pop(context),
                   child: Container(
                     height: 3.h,
                     width: 100.w,
                     decoration: const BoxDecoration(
                         color: Colors.grey,
                         borderRadius: BorderRadius.all(Radius.circular(2))),
                   ),
                 ),
               ),
               SizedBox(
                 height: 20.h,
               ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                      child: Icon(Icons.close, color: Color(0xFF111217), size: 20.h,)),
                SizedBox(width: 16.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    title !=null? Text(title??"",
                      style: sansRegular(
                          fontColor: Color(0xFF111217),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),):SizedBox.shrink(),
                    SizedBox(height: 5,),
                    subTitle!=null? Text(subTitle??"",
                        style: sansRegular(
                            fontColor: Color(0xFF666F89),
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        )):SizedBox.shrink(),
                  ],),
                ),

              ],),
               SizedBox(
                 height: 20,
               ),
               ListView.builder(
                   itemCount: items.length ,
                   shrinkWrap: true,

                   itemBuilder: ( context ,index){
                     return InkWell(
                       onTap: (){
                         onChanged(items[index]);
                         Navigator.pop(context);
                         // controller.valueSelected.value = items[index];
                         // Get.back();
                       },
                       child:  Container(
                         margin: EdgeInsets.only(top: 10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),

                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.2),
                               spreadRadius: 1,
                               blurRadius: 2,
                             ),

                           ],
                           color:Colors.white ,

                         ),
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                           child: Text(items[index],
                             style: sansRegular(
                                 fontFamily: fontFamily??"Urbanist",
                                 fontSize: 16,
                                 fontWeight: FontWeight.w500,
                                 fontColor: CustomColors().subTitleColor
                             ),),
                         ),
                       ),
                     );
                   }),
              /* Expanded(
                 child: ,
               ),*/

               SizedBox(
                 height: 10,
               ),

             ],
           ),
         ),
         backgroundColor:CustomColors().backgroundColor,
         elevation: 0,
         isScrollControlled: true,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
         ), context: context);
   }
}
