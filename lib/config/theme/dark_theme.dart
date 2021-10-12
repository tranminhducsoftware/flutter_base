import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_constants.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextLightColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextLightColor),
    bodyText2: TextStyle(color: kTextLightColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kBackgroundLightColor,
    elevation: 0,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: kBackgroundLightColor),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}
