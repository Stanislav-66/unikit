import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_event.dart';
part 'locale_state.dart';


class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeKey = 'locale';

  LocaleBloc() : super(const LocaleState(Locale('ru'))) {
    on<LocaleChanged>(_onLocaleChanged);
    on<LoadLocale>(_onLoadLocale);
  }

  Future<void> _onLocaleChanged(LocaleChanged event, Emitter<LocaleState> emit) async {
    emit(LocaleState(event.locale));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.locale.languageCode);
  }

  Future<void> _onLoadLocale(LoadLocale event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey) ?? 'ru';
    add(LocaleChanged(Locale(localeCode)));
  }
}
