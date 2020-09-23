import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode;
  bool _isDark = false;

  ThemeProvider(this._themeMode);

  getThemeMode() => _themeMode;
  getIsDark() => _isDark;

  setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
  }

  setIsDark(bool value) async {
    _isDark = value;
    notifyListeners();
  }
}