import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xff364DCD);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFFF5F5F5);
const primaryColorLight = const Color(0xFF7379FF);
const primaryColorDark = const Color(0xff00259b);
const accentColor = const Color(0xff00DBFF);

ThemeData lightTheme() {
  return ThemeData(
      brightness: brightness,
      fontFamily: "Source Sans Pro",
      textTheme: TextTheme(
        headline3: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 13,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 16,
        ),
      ),
      primaryColor: primaryColor,
      accentColor: accentColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: primaryColorDark,
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400))));
}
