import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_yandex_updated/flutter_login_yandex.dart';
import 'package:provider/provider.dart';
import 'package:unikit/app/settings_app.dart';

import 'package:user_reposytory/user_repository.dart';
import '../ui/news_screen/messager_post.dart';
import '../ui/theme/theme_app.dart';
import '../ui/theme/theme_provider.dart';
import 'bloc.dart';
import 'notification/notification_push.dart';

class AppBlocProvider extends StatelessWidget {
  final UserRepository userRepository;
  final MessageFetcher fetch;
  final FlutterLoginYandex yandex;

  const AppBlocProvider({
    super.key,
    required this.userRepository,
    required this.fetch,
    required this.yandex,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..add(AppStarted()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(userRepository: userRepository),
        ),
        BlocProvider<SignInBloc>(
          create: (context) =>
          _createSignInBloc(context)..add(AppStartedUser()),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => _createSignUpBloc(context),
        ),
        Provider<MessageFetcher>(
          create: (context) => fetch,
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(fetch),
        ),
        ChangeNotifierProvider<NotifierProviders>(
          create: (context) {
            final notifierProviders = NotifierProviders(
              ThemesApp.lightTheme(),
              const Locale('ru'),
            );
            notifierProviders.loadThemeData();
            notifierProviders.loadLocale();
            return notifierProviders;
          },
        ),
        Provider<NotificationService>(
          create: (context) => NotificationService(context),
          lazy: false, // Ensure the NotificationService is created immediately
        ),
      ],
      child: Builder(
        builder: (context) {
          context.read<NotificationService>().initialize();
          return const AppConfig();
        },
      ),
    );
  }

  SignInBloc _createSignInBloc(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return SignInBloc(
      userRepository: authBloc.userRepository,
      yandexAuth: yandex,
    );
  }

  SignUpBloc _createSignUpBloc(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return SignUpBloc(userRepository: authBloc.userRepository);
  }
}
