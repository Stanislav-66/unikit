part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final String themeName;

  ThemeChanged(this.themeName);

  @override
  List<Object> get props => [themeName];
}

class LoadTheme extends ThemeEvent {}



