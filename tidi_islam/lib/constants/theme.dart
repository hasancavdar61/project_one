import 'package:flutter/material.dart';


/// Uygulama teması buradan kontrol edilmektedir.

class AppTheme {
  ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),
    //Color
    textTheme: const TextTheme(
      headline3: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white, fontSize: 18.0),
    ),
  );
}
