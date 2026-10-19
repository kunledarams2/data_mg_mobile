
import 'package:flutter/material.dart';

sansRegular({Color? fontColor,double? fontSize,FontWeight? fontWeight,TextDecoration? textDecoration,double?lineHeight,  String? fontFamily}) =>  TextStyle(
    fontFamily: fontFamily??'InstrumentSans',
    color: fontColor??const Color(0xff575759),
    fontSize: fontSize??36,
    fontWeight: fontWeight??FontWeight.normal,
    decoration: textDecoration,
    height: lineHeight,

);