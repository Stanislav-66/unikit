import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_app.dart';

class NotifierProviders with ChangeNotifier {
  ThemeData _themeData;
  Locale _locale;

  NotifierProviders(this._themeData, this._locale);

  ThemeData get themeData => _themeData;
  Locale get locale => _locale;

  Future<void> loadThemeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeName = prefs.getString('theme') ?? 'light';
    _themeData = themeName == 'dark' ? ThemesApp.darkTheme() : ThemesApp.lightTheme();
    notifyListeners();
  }

  Future<void> setThemeData(ThemeData themeData, String themeName) async {
    _themeData = themeData;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeName);
    notifyListeners();
  }

  Future<void> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localeCode = prefs.getString('locale') ?? 'ru';
    _locale = Locale(localeCode);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    notifyListeners();
  }
}