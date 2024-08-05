import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unikit/app/loading.dart';
import 'package:unikit/app/locale/local_config.dart';
import 'package:unikit/ui/theme/theme_provider.dart';
import '../routers/routers.dart';
import 'bloc.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({
    super.key,
  });

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final notifi = Provider.of<NotifierProviders>(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppLoading) {
          return Directionality(
            textDirection: notifi.locale.languageCode == 'ru'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: MaterialApp(
                theme: notifi.themeData,
                locale: notifi.locale,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: LocalizationConfig.localizationsDelegates,
                supportedLocales: LocalizationConfig.supportedLocales,
                home: const LoadingScreen()
            ),
          );
        } else if (state is AppLoaded) {
          return ThemeProvider(
            initTheme: notifi.themeData,
            builder: (context, theme) {
              return Directionality(
                textDirection: notifi.locale.languageCode == 'ru'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: MaterialApp.router(
                  title: "Unikit",
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: LocalizationConfig.localizationsDelegates,
                  routerDelegate: _appRouter.delegate(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  supportedLocales: LocalizationConfig.supportedLocales,
                  locale: notifi.locale,
                  theme: theme,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
