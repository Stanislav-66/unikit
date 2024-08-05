
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login_yandex_updated/flutter_login_yandex.dart';

import 'package:user_reposytory/user_repository.dart';
import 'app.dart';
import 'app/app_life.dart';

import 'app/simple_bloc_observer.dart';
import 'ui/news_screen/messager_post.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();

  final messageFetcher = MessageFetcher();
  bool newsLoaded = false;
  _loadNews(messageFetcher, newsLoaded);

  runApp(
    AppLifecycleReactor(
      messageFetcher: messageFetcher,
      child: MyApp(FireBaseUserRepository(), messageFetcher, authYandex: FlutterLoginYandex()),
    ),
  );
}

void _loadNews(MessageFetcher messageFetcher, bool newsLoaded) async {
  if (!newsLoaded) {
    await messageFetcher.loadNews();
    newsLoaded = true;
  }
}





