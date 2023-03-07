import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool isDarkTheme = false;

  ThemeMode get themeMode => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme =
        !isDarkTheme; //👈 this will change the value of isDarkTheme leading to themeMode being changed
    notifyListeners(); //👈 this will notify all listeners and carry out any function that is in the addListener() method that we will add soon
  }
}
