import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  Color get backgroundColor => const Color(0xFFFFFFFF);
  Color get primaryColor => const Color(0xFF1F1B17);

  Color get accentColor => const Color(0xFFFB8500);
  Color get lightOrange => const Color(0xFFFFF3E6);
  Color get lightGrey => const Color(0xFFF4F4F4);
  Color get textLightGrey => const Color(0xFF90949E);
  Color get searchBarGrey => const Color(0xFFEFEFF0);
  Color get red => const Color(0xFFFF3B30);
  Color get hintColor => const Color(0xFF6F6B67);
  Color get lighterGrey => const Color(0xFFF2F2F2);
  Color get textGrey => const Color(0xFF4F4F4F);
  Color get primaryTextColor => const Color(0x991F1B17);
  Color get green => const Color(0xFF86F80D);
  Color get darkModeBackgroundColor => const Color(0xFF1C1C1E);
  Color get darkModePrimaryColor => const Color(0xFFFFFFFF);
  Color get darkModeAccentColor => const Color(0xFFFB8500);
  Color get darkModeLightGrey => const Color(0xFF2C2C2C);
  Color get darkModeRed => const Color(0xFFFF3B30);
  Color get darkModeHintColor => const Color(0xFFEBEBF5);
  Color get darkModeLighterGrey => const Color(0xFF2C2C2C);
  Color get darkModeTextGrey => const Color(0x80FFFFFF);
  Color get darkModeGreen => const Color(0xFF86F80D);
  Color get appBackgroundColor => const Color(0xffCC3366);
  Color get lightAppColor => const Color(0xfff5d6e5);
  Color get lightTextHeaderColor => const Color(0xffFAFAFB);
  Color get iconsColor =>const Color(0xFFE085A3);
  Color get subTitleColor =>const Color(0xFF666666);
  Color get inActiveButColor =>const Color(0XFFE5E5E5);
  Color get inActiveButTextColor =>const Color(0XFF90949E);
  Color get activeButColor =>const Color(0XFF0D0D0D);
  // Color get subTextColor =>const Color(0XFF666F89);



  String get interFontFamily => 'Inter';

  ThemeData get themeData => ThemeData(
    unselectedWidgetColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    splashColor: Colors.transparent,
    // ignore: deprecated_member_use
    hintColor: accentColor,
    primaryColorDark: primaryColor,
    dividerColor: lightGrey,
    cardColor: red,
    // hintColor: hintColor,
    disabledColor: Colors.transparent,
    highlightColor: Colors.transparent,
    secondaryHeaderColor: Colors.black,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: -0.41,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.24,
        color: hintColor,
      ),
      titleMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: hintColor,
      ),
      titleSmall: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: primaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        letterSpacing: 1,
        color: primaryColor,
      ),
      displayMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: 1,
        color: primaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: -0.24,
        color: primaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: -0.24,
        color: backgroundColor,
      ),
    ),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(

          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        )
    ), checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return primaryColor; }
      return null;
    }),
  ), radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return primaryColor; }
      return null;
    }),
  ), switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return primaryColor; }
      return null;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return primaryColor; }
      return null;
    }),
  ),
    // colorScheme: ColorScheme(background: backgroundColor, brightness: null)
    // buttonTheme: ButtonThemeData(
    //   height: 37,
    //   minWidth: 237,
    //   buttonColor: accentColor,
    //   disabledColor: lightGrey,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(18.5),
    //   ),
    // ),
  );

  ThemeData get darkModeThemeData => ThemeData(
    brightness: Brightness.dark,
    unselectedWidgetColor: darkModePrimaryColor,
    scaffoldBackgroundColor: darkModeBackgroundColor,
    primaryColor: darkModePrimaryColor,
    splashColor: Colors.transparent,
    primaryColorDark: darkModePrimaryColor,
    // ignore: deprecated_member_use
    hintColor: darkModeAccentColor,
    dividerColor: darkModeLightGrey,
    cardColor: darkModeRed,
    // hintColor: darkModeHintColor,
    disabledColor: darkModePrimaryColor,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: -0.41,
        color: darkModePrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.24,
        // height: 21,
        color: darkModePrimaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: darkModeHintColor,
      ),
      titleSmall: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: darkModePrimaryColor,
      ),
      displayLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        letterSpacing: 1,
        color: darkModePrimaryColor,
      ),
      displayMedium: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: 1,
        color: darkModePrimaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: -0.24,
        color: darkModePrimaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: interFontFamily,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: -0.24,
        color: darkModePrimaryColor,
      ),
    ), checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return darkModePrimaryColor; }
      return null;
    }),
  ), radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return darkModePrimaryColor; }
      return null;
    }),
  ), switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return darkModePrimaryColor; }
      return null;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) { return null; }
      if (states.contains(MaterialState.selected)) { return darkModePrimaryColor; }
      return null;
    }),
  ),
    // colorScheme: ColorScheme(background: darkModeBackgroundColor),
    //     // buttonTheme: ButtonThemeData(
    //     //   height: 37,
    //     //   minWidth: 237,
    //     //   buttonColor: accentColor,
    //     //   disabledColor: lightGrey,
    //     //   shape: RoundedRectangleBorder(
    //     //     borderRadius: BorderRadius.circular(18.5),
    //     //   ),
    //     // ),
  );
}
