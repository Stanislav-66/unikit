import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unikit/ui/user_info_page/user_info.dart';

import '../ui/auth_screen/auth.dart';
import '../ui/documents_screen/document.dart';
import '../ui/home_screen/home.dart';
import '../ui/home_screen/main_screen.dart';
import '../ui/news_screen/messager_post.dart';
import '../ui/news_screen/news.dart';
import '../ui/speciality_screen/widgets/pdf_view.dart';
import '../ui/ui.dart';
part 'routers.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  //final AuthBloc authBloc;

 // AppRouter(this.authBloc);
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page, path: "/", initial: true, children: [
      AutoRoute(page: MainRoute.page, path: "home"),
      AutoRoute(page: AuthorizationRoute.page, path: "auth", children: [
        AutoRoute(page: SignInRoute.page, path: "signin"),
        AutoRoute(page: SignUpRoute.page, path: "signup"),
      ]),
    ]),
    AutoRoute(page: DocumentRoute.page, path: "/doc"),
    AutoRoute(page: PDFViewerRoute.page, path: "/pdf"),
    AutoRoute(page: SpecialityRoute.page, path: "/special"),
    AutoRoute(page: NewsRoute.page, path: "/news"),
    AutoRoute(page: TeachersRoute.page, path: "/teacher"),
    AutoRoute(page: ContactRoute.page, path: "/contact",),
    AutoRoute(page: QuestRoute.page, path: "/chat",),
    AutoRoute(page: SettingsRoute.page, path: "/setting",),
  ];
}

