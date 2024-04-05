import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier  {

  ThemeData theme;

  UIProvider({
    required bool isDarkMode
  }) : theme = isDarkMode ? ThemeData.dark() : ThemeData.light(); 

  setLightMode() {
    theme = ThemeData.light();
    
    notifyListeners();
  }

  setDarkMode() {
    theme = ThemeData.dark();
    
    notifyListeners();
  }
}

