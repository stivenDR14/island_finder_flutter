import 'package:flutter/material.dart';

ThemeData generalTheme() {
  return ThemeData(
      splashColor:Colors.cyan ,
      primaryColor: Colors.cyan,
      focusColor: Colors.lightGreen,
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.white60,
      primaryColorDark: Colors.white24,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold, color: Colors.white70),
        headline2: TextStyle(fontSize: 26.0,  fontWeight: FontWeight.w500, color: Colors.white70),
        bodyText1: TextStyle(fontSize: 14.0,  fontWeight: FontWeight.w300, color: Colors.white70),
        bodyText2: TextStyle(fontSize: 14.0,  fontWeight: FontWeight.w500, color: Colors.white70),
      )
  );
}