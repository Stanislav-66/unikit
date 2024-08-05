part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState(this.theme);

  @override
  List<Object> get props => [theme];
}
class SuccesTheme extends ThemeState{
  const SuccesTheme(super.theme);
}
