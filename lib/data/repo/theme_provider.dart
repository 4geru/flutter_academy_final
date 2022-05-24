import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadTheme();
  }
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    current = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeMode current = ThemeMode.dark;
  bool isDark = true;

  Future<void> toggle() async {
    isDark = !isDark;
    current = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }
}
