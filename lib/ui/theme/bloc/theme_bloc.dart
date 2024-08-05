import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme_app.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'theme';

  ThemeBloc() : super(ThemeState(ThemesApp.lightTheme())) {
    on<ThemeChanged>(_onThemeChanged);
    on<LoadTheme>(_onLoadTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themeKey) ?? 'light';
    final themeData = themeName == 'dark' ? ThemesApp.darkTheme() : ThemesApp.lightTheme();
    emit(ThemeState(themeData));
  }

  Future<void> _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    final newTheme = event.themeName == 'dark' ? ThemesApp.darkTheme() : ThemesApp.lightTheme();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, event.themeName);
    emit(ThemeState(newTheme));
  }
}

