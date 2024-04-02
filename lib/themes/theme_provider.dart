// helps to switch between light mode and dark mode


import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';
import 'package:food_delivery_app/themes/theme_preference';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;
  static const String _themePreferenceKey = 'theme_preference';
  final ThemePreference _themePreference = ThemePreference();

  ThemeProvider() {
    _init();
  }

  Future<void> _init() async {
    await _loadThemePreference();
  }
 

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    _saveThemePreference(isDarkMode);
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }

  Future<void> _loadThemePreference() async {
    await _themePreference.init();
    final isDarkMode = _themePreference.getBox().get(_themePreferenceKey) ?? false;
    themeData = isDarkMode ? darkMode : lightMode;
  }

  Future<void> _saveThemePreference(bool isDarkMode) async {
    await _themePreference.init();
    await _themePreference.getBox().put(_themePreferenceKey, isDarkMode);
  }
}