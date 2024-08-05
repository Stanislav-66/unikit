import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/theme/theme_app.dart';
import 'package:unikit/ui/theme/theme_provider.dart';
import 'package:unikit/ui/widgets/app_bar_center.dart';
import '../../app/bloc.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> languages = [S.of(context).english, S.of(context).russian];
    final themes = Theme.of(context);
    final notifi = Provider.of<NotifierProviders>(context);
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).settings,
              backgroundColor: themes.colorScheme.primary,
              padding: 60,
            ),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(S.of(context).main_settings, style: themes.textTheme.bodyMedium),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).local, style: themes.textTheme.bodyMedium),
                      DropdownButton<String>(
                        value: notifi.locale.languageCode,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: themes.textTheme.bodyMedium,
                        iconDisabledColor: themes.iconTheme.color,
                        iconEnabledColor: notifi.themeData == ThemesApp.lightTheme() ? Colors.black : themes.iconTheme.color,
                        underline: Container(
                          height: 2,
                          color: themes.colorScheme.primary,
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            //context.read<LocaleBloc>().add(LocaleChanged(Locale(value)));
                            notifi.setLocale(Locale(value));
                          }
                        },
                        items: languages.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value == S.of(context).english ? 'en' : 'ru',
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  leading: const Icon(Icons.language),
                ),
                ListTile(
                  leading: ThemeSwitcher.withTheme(
                    builder: (context, switcher, theme) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linear,
                        child: notifi.themeData == ThemesApp.darkTheme()
                            ? const Icon(Icons.nightlight_round, key: ValueKey('darkThemeIcon'))
                            : const Icon(Icons.wb_sunny, key: ValueKey('lightThemeIcon')),
                      );
                    },
                  ),
                  title: ThemeSwitcher.withTheme(
                    builder: (context, switcher, theme) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).theme_update),
                          Switch(
                            value: notifi.themeData == ThemesApp.darkTheme(),
                            onChanged: (value) async {
                              String newTheme = value ? 'dark' : 'light';
                              ThemeData newThemeData = newTheme == 'dark' ? ThemesApp.darkTheme() : ThemesApp.lightTheme();
                              switcher.changeTheme(theme: newThemeData);
                              await notifi.setThemeData(newThemeData, newTheme);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
