import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  void toogleThemeMode(BuildContext context) {
    _themeMode = isDarkMode(context) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
