import 'package:flutter/material.dart';
import '../services/theme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  ThemeMode _themeMode = ThemeMode.dark;
  bool _isDark = true;
  get themeMode => _themeMode;
  get isDark => _isDark;

  set setDarkTheme(bool value) {
    _isDark = value;
    if (_isDark == true) {
      _themeMode = ThemeMode.dark;
      _isDark = true;
    } else {
      _themeMode = ThemeMode.light;
      _isDark = false;
    }
    darkThemePrefs.setTheme(value);
    notifyListeners();
  }
}
