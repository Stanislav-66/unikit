import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unikit/routers/routers.dart';
import 'package:unikit/ui/home_screen/widgets/widgets.dart';


import '../../app/bloc.dart';
import '../../generated/l10n.dart';
import '../news_screen/creator_widgets.dart';
import '../news_screen/messager_post.dart';

@RoutePage()
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  void _openNavigation(int index, TabsRouter router) {
    router.setActiveIndex(index);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    GlobalKey<AutoTabsRouterState> key = GlobalKey<AutoTabsRouterState>();
    List<PageRouteInfo<dynamic>> routes = [const MainRoute(), const AuthorizationRoute()];
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return AutoTabsRouter(
      key: key,
      routes: routes,
      builder: (context, child) {
        final tabs = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: colorScheme.primary,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: theme.iconTheme.color,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            actions: [
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchActive) {
                    return IconButton(
                      icon: const Icon(Icons.clear),
                      color: theme.iconTheme.color,
                      onPressed: () => searchBloc.add(SearchEnded()),
                    );
                  }
                  return IconButton(
                    color: theme.iconTheme.color,
                    icon: const Icon(Icons.search),
                    onPressed: () => searchBloc.add(SearchStarted()),
                  );
                },
              ),
            ],
            title: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchActive) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: TextField(
                        key: const ValueKey('SearchTextField'),
                        onChanged: (query) => searchBloc.add(SearchQueryChanged(query)),
                        autofocus: true,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: S.of(context).search,
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: Colors.white70),
                          prefixIcon: const Icon(Icons.search, color: Colors.white70),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                }
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: Text(
                      S.of(context).title_appbar,
                      style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
          drawer: AnimatedDrawer(
            drawerItems: [
              AnimatedDrawer.createDrawerItem(
                  context, Icons.article, S.of(context).news, () {
                var messageFetcher =
                    Provider.of<MessageFetcher>(context, listen: false);
                AutoRouter.of(context)
                    .push(NewsRoute(messageFetcher: messageFetcher));
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.book, S.of(context).title_special, () {
                AutoRouter.of(context).push(const SpecialityRoute());
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.school, S.of(context).teachers, () {
                AutoRouter.of(context).push(const TeachersRoute());
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.phone, S.of(context).contact, () {
                AutoRouter.of(context).push(const ContactRoute());
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.chat, S.of(context).question_title, () {
                AutoRouter.of(context).push(const QuestRoute());
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.insert_drive_file, S.of(context).document_title, () {
                AutoRouter.of(context).push(const DocumentRoute());
              }),
              AnimatedDrawer.createDrawerItem(
                  context, Icons.settings, S.of(context).settings, () {
                AutoRouter.of(context).push(const SettingsRoute());
              }),

              AnimatedDrawer.createDrawerItem(
                  context, Icons.exit_to_app, S.of(context).exit, () {
                SystemNavigator.pop();
              }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home), label: S.of(context).homePage),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.account_circle,
                  ),
                  label: S.of(context).navigateBottom2)
            ],
            backgroundColor: theme.colorScheme.primary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
            ),
            onTap: (index) => _openNavigation(index, tabs),
            currentIndex: tabs.activeIndex,
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchActive && state.results.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    final searchItem = state.results[index];
                    return searchItem.content;
                  },
                );
              }
              return child;
            },
          ),
        );
      },
    );
  }
}


