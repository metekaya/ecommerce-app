import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'Raleway',
      scaffoldBackgroundColor:
          isDarkTheme ? MyColors.scaffoldDark : Colors.grey.shade300,
      primarySwatch: Colors.green,
      primaryColor: isDarkTheme ? MyColors.mainColor : Colors.grey.shade300,
      accentColor: MyColors.secondaryColor,
      backgroundColor:
          isDarkTheme ? MyColors.darkBackground : Colors.grey.shade200,
      indicatorColor: isDarkTheme ? Colors.grey : MyColors.endColor2,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? MyColors.mediumGrey : MyColors.endColor2,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : MyColors.endColor2,
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: MyColors.mediumGrey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? MyColors.scaffoldDark : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
