import 'package:data_mangr/controller/authentication_controller.dart';

import 'package:data_mangr/views/auth/payment_page.dart';
import 'package:data_mangr/views/auth/presentation/model/model/subscribe_request_model.dart';
import 'package:data_mangr/views/auth/presentation/model/model/subscription_plan_response.dart';
import 'package:data_mangr/views/auth/presentation/registration/reg_success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/client/app_response.dart';
import '../../data/client/result.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart';
import '../global_widget/page_header_widget.dart';
import '../global_widget/rounded_button.dart';
import '../tab_host_page.dart';

class SubscriptionListPage extends GetView<AuthenticationController> {
   SubscriptionListPage({Key? key, required this.regisData}) : super(key: key);

  final dynamic regisData;
  Future<void> _handleSubscription(SubscriptionPlan subscriptionPlan) async {


    var uuid = Uuid();
    print(uuid.v4());

    var subscribeRequest = SubscribeRequest(
        amount: subscriptionPlan.price.toString(),
        email: regisData['data']['email'],
        plan_id: subscriptionPlan.id.toString(),
        payment_reference: 'Ref-${uuid.v4()}',
        user_id: regisData['data']['id'].toString()
       );

    var result = await controller.planSubscribe(subscribeRequest);

    final appResponse = AppResponse.fromJson(result);

    if ( appResponse.success) {

      Get.to(()=>RegSuccessPage());

    } else {
      Get.snackbar('Error ', (result as Failure).message,
          backgroundColor: CustomColors().appBackgroundColor,colorText: Colors.white);
      return;
    }

    print(result);
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
              Text("Choose a plan",
                  style: sansRegular(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      lineHeight: 1.5,
                      fontColor: Colors.black)),

              Text("Select a suitable plan for your organisation",

                  style: sansRegular(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      lineHeight: 1.5,
                      fontColor: CustomColors().subTitleColor)),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  
                  child: Obx(() =>  ListView.builder(
                      itemCount: controller.subPlanList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i){
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0XFFE5E5E5))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row( children: [
                                    Text(controller.subPlanList[i].name,
                                        style: sansRegular(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            lineHeight: 1.5,
                                            fontColor: Colors.black)),
                                    Spacer(),
                                    Text( controller.subPlanList[i].price ==0?"Free":"NGN ${controller.subPlanList[i].price.toString()}/Month",
                                        style: sansRegular(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            lineHeight: 1.5,
                                            fontColor: Colors.black))
                                  ],),
                                  SizedBox(height: 10,),

                                  Row(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Store up to ${controller.subPlanList[i].entries}",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Add ${controller.subPlanList[i].team_member} team member",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Send up to ${controller.subPlanList[i].messages} messages",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Get ${controller.subPlanList[i].themes} free themes",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ),
                                  controller.subPlanList[i].can_export?  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Export data as a file",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ):SizedBox.shrink(),
                                  controller.subPlanList[i].can_view_analysis?  Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(color:  CustomColors().subTitleColor, borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("Basic data analysis",
                                          style: sansRegular(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              lineHeight: 1.5,
                                              fontColor: CustomColors().subTitleColor)),
                                    ],
                                  ):SizedBox.shrink(),

                                  RoundedButton(
                                    text: 'Continue',
                                    press: () {


                                     if( controller.subPlanList[i].price==0){
                                       _handleSubscription(controller.subPlanList[i]);

                                     }else{
                                       Get.to(()=>PaymentPage(regisData: regisData, subscriptionPlan: controller.subPlanList[i],));
                                     }
                                    },
                                    textColor: Colors.white,
                                    color: CustomColors().primaryColor,
                                    isButtonFilledColor: true,
                                    buttonWidth: 4,
                                    marginVertical: 0,
                                  ),

                                ],),
                            ),),
                        );

                      })),
                ),
              )



            ],
          ),
        ),
      ),
    );;
  }
}
