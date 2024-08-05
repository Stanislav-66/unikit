import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unikit/routers/routers.dart';

import '../user_info_page/user_info.dart';
import 'bloc/sign_in/sign_in_bloc.dart';

@RoutePage()
class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _openNavigation(int index, TabsRouter router) {
    router.setActiveIndex(index);
    _tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInProcess) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SignInSuccess) {
          return const UserInfoScreen();
        } else {
          return AutoTabsRouter(
            routes: const [SignInRoute(), SignUpRoute()],
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);

              return Column(
                children: [
                  Center(
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Sign In'),
                        Tab(text: 'Sign Up'),
                      ],
                      onTap: (index) => _openNavigation(index, tabsRouter),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: tabsRouter.stack.map((route) => route.child).toList(),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
