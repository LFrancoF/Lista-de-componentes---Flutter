import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primaryColor =  Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      
      //Primary color
      primaryColor: primaryColor,

      //Appbar theme
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0
      ),

      //TextButton theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColor)
      ),

      //FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        elevation: 5
      ),

      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: const StadiumBorder(),
            elevation: 0
        )
      ),

      //InputsFormFields
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
      )


  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0
      ),
      scaffoldBackgroundColor: Colors.black
  );

}