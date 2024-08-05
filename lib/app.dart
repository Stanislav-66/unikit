import 'package:flutter/material.dart';
import 'package:flutter_login_yandex_updated/flutter_login_yandex.dart';
import 'package:provider/provider.dart';
import 'package:unikit/app/app_providers.dart';
import 'package:unikit/app/notification/notification_push.dart';
import 'package:unikit/ui/news_screen/messager_post.dart';
import 'package:user_reposytory/user_repository.dart';

import 'ui/theme/theme_provider.dart';


class MyApp extends StatefulWidget {
  final FireBaseUserRepository userRepository;
  final MessageFetcher fetch;
  final FlutterLoginYandex authYandex;

  const MyApp(this.userRepository, this.fetch, {super.key, required this.authYandex});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return AppBlocProvider(userRepository: widget.userRepository,fetch: widget.fetch, yandex: widget.authYandex,);
  }
}
