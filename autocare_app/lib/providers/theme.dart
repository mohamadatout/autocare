import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark;
  ThemeProvider({required this.isDark});

  Future<void> toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final check = prefs.getBool("isDark");

    isDark = check ?? false;

    notifyListeners();

    prefs.setBool("isDark", !(check ?? false));
  }

  static Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final check = prefs.getBool("isDark");

    return check ?? false;
  }
}
