
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

import '../../theme/app_theme.dart';
import '../../theme/sansRegular.dart'; //lib/views/global_widget/validation_mixin.dart
import 'package:data_mangr/views/global_widget/validation_mixin.dart';



class InputField extends StatefulWidget {
  // final Widget textFieldLabel;
  final bool isEmail;
  final bool isPhoneNumber;
  final bool isDateField;
  // final isNumber;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final Color? textFieldFillColor, textFieldTextColor;
  final bool isPassword;
  final bool isReadOnly;
  final ValueChanged<String> onChanged;
  final Function(String)? validator;
  final TextEditingController? editingController;
  final bool isEnableOutLineBoarder;
  final int? maxLine, maxLength;
  final bool isEnable;
  final String? suffixIconPath;

  final Icon? suffixIcon;
  final String? suffixText;
  final String? label;
  final bool isCurrency;
 final DateTime? currentDateValue;
  final int? lastDateValue;

  // final TextInputType textInputType;

  const InputField(
      {Key? key,
      this.hintText,
      required this.onChanged,
      required this.isEmail,
      required this.isPhoneNumber,
        // required this.isNumber,
      this.isDateField = false,
      this.editingController,
      this.labelText,
      this.textInputAction,
      this.textFieldFillColor,
      this.textFieldTextColor,
      required this.isPassword,
      this.isReadOnly = false,
      this.isEnableOutLineBoarder = false,
      this.maxLine = 1,
      this.maxLength = 1,
      this.isEnable = true,
      this.suffixIconPath,
      this.suffixIcon,
      this.suffixText,
      this.validator,
      this.label,
        this.isCurrency = false,
        this.currentDateValue,
        this.lastDateValue,
      // required this.textFieldLabel,
      /*  required this.textInputType*/
      })
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> with ValidationMixin {
  bool hidePassword = true;

  // FocusNode mFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: sansRegular(
                    fontColor: Get.isDarkMode
                        ? CustomColors().darkModePrimaryColor
                        : Color(0xFF6A6C6E),
                    fontSize: 15,
                    lineHeight: 1.5,
                    fontWeight: FontWeight.w500),
              )
            : const SizedBox.shrink(),
        widget.label != null
            ? const SizedBox(
                height: 5,
              )
            : SizedBox.shrink(),
        widget.isDateField
            ? DateTimeField(
                readOnly: widget.isReadOnly,
                obscureText: widget.isPassword ? hidePassword : false,
                controller: widget.editingController,
                enabled: widget.isEnable,
                validator: (val) {
                  String input = widget.editingController?.text.trim() ??
                      val.toString() ??
                      '';
                  if (input.isEmpty) {
                    return "${widget.labelText} must not be empty";
                  } else
                    return null;
                },
                // focusNode: mFocusNode ,
                /* validator: (val) {
                print(val);
                String input = widget.editingController?.text.trim() ?? val.toString() ?? '';
                return widget.isEmail ? GetUtils.isEmail(input) ? null : 'Please Enter a Valid Email Address' : widget.isPhoneNumber
                        ? validatePhonenumber(val.toString() ?? '') : widget.isPassword ? validatePassword(val.toString() ?? '') : validateUsername(val.toString() ?? '', widget.labelText ?? "");
              },*/
                onChanged: (val) => widget.onChanged,
                textInputAction: widget.textInputAction,
                cursorColor: Get.isDarkMode
                    ? CustomColors().darkModePrimaryColor
                    : Color(0XFF333333),
                style: sansRegular(
                    fontColor: Get.isDarkMode
                        ? CustomColors().darkModePrimaryColor
                        : Color(0XFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                keyboardType: widget.isPhoneNumber
                    ? const TextInputType.numberWithOptions(signed: true)
                    : TextInputType.text,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  labelText: widget.labelText, labelStyle: sansRegular(fontSize: 14, fontColor: Color(0xFFBABEC2),),
                  floatingLabelStyle:
                  sansRegular(
                    fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontColor:  Get.isDarkMode
                      ? CustomColors().darkModePrimaryColor
                      : Color(0XFF333333)),
                  fillColor:  Get.isDarkMode
                      ? CustomColors().appBackgroundColor
                      : Color(0XFF333333),
                  enabledBorder: widget.isEnableOutLineBoarder
                      ? const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffC4C4C4)),
                          borderRadius: BorderRadius.all(Radius.circular(8)))
                      : const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffC4C4C4))),
                  focusedBorder: widget.isEnableOutLineBoarder
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Get.isDarkMode
                                  ? CustomColors().darkModePrimaryColor
                                  : Color(0XFF333333)))
                      : UnderlineInputBorder(
                          borderSide:
                              BorderSide(color:Get.isDarkMode
                                  ? CustomColors().darkModePrimaryColor
                                  : Color(0XFF333333))),
                  enabled: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: widget.isPassword
                          ? hidePassword
                              ? Icon(
                                  Icons.visibility,
                                  color: Get.isDarkMode
                                      ? CustomColors().darkModePrimaryColor
                                      : Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Get.isDarkMode
                                      ? CustomColors().darkModePrimaryColor
                                      : Colors.grey,
                                )
                          : widget.suffixIcon ?? const SizedBox()),
                ),
                format: DateFormat("yyyy-MM-dd"),
                onShowPicker: (BuildContext context, currentDateValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1930),
                    initialDate: currentDateValue ?? DateTime.now(),
                    lastDate: widget.lastDateValue !=null?DateTime(widget.lastDateValue??0): DateTime.now(),
                    builder: (BuildContext? context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light().copyWith(
                            primary:  Colors.black
                          ), //selection color
                        ),
                        child: child!,
                      );
                    },
                  );
                },
              )
            : TextFormField(
                readOnly: widget.isReadOnly,
                obscureText: widget.isPassword ? hidePassword : false,
                controller: widget.editingController,
                enabled: widget.isEnable,

               /* inputFormatters: [
               if(widget.isCurrency ) CurrencyInputFormatter()
                ],*/

                // focusNode: mFocusNode ,
                validator: (String? val) {
                  print(val);
                  // String? validationResult = widget.validator!(val!);
                  String input =
                      widget.editingController?.text.trim() ?? val ?? '';
                  return widget.isEmail
                      ? GetUtils.isEmail(input)
                          ? null
                          : 'Please Enter a Valid Email Address'
                      : widget.isPhoneNumber
                          ? validatePhonenumber(val ?? '')
                          : widget.isPassword
                              ? validatePassword(val ?? '')
                              : validateUsername(
                                  val ?? '', widget.labelText ?? "");
                },
                onChanged: widget.onChanged,
                textInputAction: widget.textInputAction,
                cursorColor:Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333)/*AppTheme().appBackgroundColor*/,

                style: sansRegular(
                    fontColor: Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                keyboardType: widget.isPhoneNumber ? const TextInputType.numberWithOptions(signed: true) : TextInputType.text,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  labelText: widget.labelText,
                  labelStyle: sansRegular(
                    fontSize: 14,
                    fontColor: Color(0xFFBABEC2),
                  ),
                  floatingLabelBehavior: widget.label != null ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,
                  floatingLabelStyle:
                  sansRegular(
                    fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontColor: Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333)),
                  fillColor: Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: widget.isEnableOutLineBoarder ? const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC4C4C4)),
                          borderRadius: BorderRadius.all(Radius.circular(10)))
                      : const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffC4C4C4)),
                        ),
                  focusedBorder: widget.isEnableOutLineBoarder ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333)),
                          borderRadius: BorderRadius.all(Radius.circular(10)))
                      : UnderlineInputBorder(borderSide: BorderSide(color: Get.isDarkMode ? CustomColors().darkModePrimaryColor :  Color(0XFF333333))),
                  enabled: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: widget.isPassword
                          ? hidePassword
                              ? /*Text('Show',
                style: interRegular(fontColor:
                  AppTheme().appBackgroundColor
                  , fontSize: 14, fontWeight: FontWeight.w400),)*/
                              Icon(
                                  Icons.visibility,
                                  color: Get.isDarkMode
                                      ? CustomColors().darkModePrimaryColor
                                      : Colors.grey,
                                )
                              :
                              Icon(
                                  Icons.visibility_off,
                                  color: Get.isDarkMode
                                      ? CustomColors().darkModePrimaryColor
                                      : Colors.grey,
                                )
                          : widget.suffixIcon ??
                              Text(
                                widget.suffixText ?? "",
                                style: sansRegular(
                                    fontColor: CustomColors().appBackgroundColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )),
                ),
                maxLines: widget.maxLine,
              ),
      ],
    );
  }
}
