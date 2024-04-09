import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier  {

  ThemeData theme;

  bool _isMultiplayer = true;

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

  get isMultiplayer => _isMultiplayer;

  set isMultiplayerr(bool flag) {
    _isMultiplayer = flag;
  }
}

