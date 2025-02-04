import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsProvider extends ChangeNotifier{

  ///observer pattern
  ///singelton


  List<String> _languages = ["English", "عربي"];
  List<String> _Themes = ["light", "Dark"];

  List<String> get languages => _languages;
  List<String> get Themes => _Themes;


  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.light;

  void setNewLanguage(String newLanguage){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  void setNewTheme(ThemeMode newThemeMode){
    if(currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  bool isDarkTheme(){
    return currentThemeMode == ThemeMode.dark;
  }
}