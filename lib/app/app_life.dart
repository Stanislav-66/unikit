import 'package:flutter/material.dart';

import '../ui/news_screen/messager_post.dart';

class AppLifecycleReactor extends StatefulWidget {
  final Widget child;
  final MessageFetcher messageFetcher;

  const AppLifecycleReactor({super.key, required this.child, required this.messageFetcher});

  @override
  _AppLifecycleReactorState createState() => _AppLifecycleReactorState();
}

class _AppLifecycleReactorState extends State<AppLifecycleReactor> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      widget.messageFetcher.cancelRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}