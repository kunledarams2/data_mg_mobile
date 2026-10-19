

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/sansRegular.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final bool isButtonDisabled;
  final Function()? press;
  final Color color, textColor;
  final double screenWidth;
  final bool isLoading;
  final double? buttonWidth;
  final double? buttonHeight;

  final bool isButtonFilledColor;
  final double? marginVertical;

  const RoundedButton(
      {Key? key,
        required this.text,
        required this.press,
        required this.color,
        required this.textColor,
        this.screenWidth = 0.8,
        this.isButtonDisabled = false,
        this.isLoading = false,
        this.buttonWidth,
        this.textSize,
        this.buttonHeight,
    required this.isButtonFilledColor,
      this.marginVertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:  EdgeInsets.symmetric(vertical: marginVertical?? 10),
      width: buttonWidth !=null?  size.width * buttonWidth!:size.width *0.8,
      height: buttonHeight !=null?  size.height * buttonHeight!: size.height * 0.08,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 0),
        child: TextButton(
          // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
          // color: isButtonDisabled ? color.withOpacity(0.3) : color,
          onPressed: isButtonDisabled ? () {} : press,
          style: TextButton.styleFrom(
            backgroundColor: isButtonDisabled ? color : isButtonFilledColor ? color: Colors.transparent,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            side: BorderSide(color: color)


          ),
          // splashColor: Colors.transparent,
          child: isLoading ? const Center(
              child: SizedBox(
                  height: 19,
                  width: 19,
                  child: CircularProgressIndicator(color: Colors.white)))
              : Text(
            text,
            style: sansRegular(
                fontColor: textColor,
                fontSize: textSize ?? 15,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}