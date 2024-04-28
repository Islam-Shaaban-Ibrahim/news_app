import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String appLanguage = 'en';

  void changeLanguage(String newLang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (appLanguage == newLang) {
      return;
    }
    appLanguage = newLang;
    prefs.setString('lang', newLang);
    notifyListeners();
  }

  void getAllPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('lang') != null) {
      appLanguage = prefs.getString('lang')!;
    }
    notifyListeners();
  }
}
