import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode current = ThemeMode.dark;
  bool isDark = true;

  toggle() {
    isDark = !isDark;
    current = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
