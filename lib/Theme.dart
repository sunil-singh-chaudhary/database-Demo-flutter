import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.green),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 30),
        headlineMedium: TextStyle(color: Colors.white, fontSize: 25)),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: Colors.white));

ThemeData darkTheme = ThemeData(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: Colors.white, fontSize: 26),
      bodyMedium: const TextStyle(color: Colors.white, fontSize: 22),
      bodySmall: const TextStyle(color: Colors.white, fontSize: 18),
      headlineLarge: TextStyle(color: Colors.blueGrey[900], fontSize: 30),
      headlineMedium: TextStyle(color: Colors.blueGrey[900], fontSize: 28),
      headlineSmall: TextStyle(color: Colors.blueGrey[900], fontSize: 26),
      labelLarge:
          const TextStyle(color: Color.fromARGB(255, 61, 58, 58), fontSize: 24),
      titleSmall: const TextStyle(color: Colors.white, fontSize: 22),
      titleMedium: const TextStyle(color: Colors.white, fontSize: 24),
      titleLarge: const TextStyle(color: Colors.white, fontSize: 26),
    ),
    hintColor: Colors.amber,
    dialogTheme: DialogTheme(
      elevation: 10,
      shadowColor: Colors.grey[100],
      alignment: Alignment.center,
      shape: const CircleBorder(side: BorderSide(color: Colors.orange)),
    ),
    checkboxTheme: const CheckboxThemeData(
        shape: CircleBorder(side: BorderSide(color: Colors.orange))),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(background: Colors.blueGrey[900]));
