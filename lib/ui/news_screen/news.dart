import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/news_screen/creator_widgets.dart';
import 'package:unikit/ui/news_screen/video_player.dart';


import 'messager_post.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  final MessageFetcher messageFetcher;

  const NewsScreen({super.key, required this.messageFetcher});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool showDialogAfterDelay = false;




  Future<void> fetchMessages({bool reset = false, int timer = 3}) async {
    if (reset || widget.messageFetcher.savedList.isEmpty) {
      _startTimeoutTimer(timer);
    }
    await widget.messageFetcher.fetchMessages(reset: reset);
    if (mounted) {
      setState(() {});
    }
  }

  void _startTimeoutTimer(int timer) {
    showDialogAfterDelay = false;
    Future.delayed(Duration(seconds: timer), () {
      if (mounted &&
          (widget.messageFetcher.isLoading)) {
        setState(() {
          showDialogAfterDelay = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMessages(reset: true);

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).news,
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
        ),
        iconTheme: theme.iconTheme,
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              fetchMessages(reset: true);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: showDialogAfterDelay
          ? buildError(theme)
          : Center(
        child: widget.messageFetcher.messages.isEmpty
            ? const CircularProgressIndicator()
            : RefreshIndicator(
          onRefresh: () => fetchMessages(reset: true),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!widget.messageFetcher.isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                fetchMessages();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: widget.messageFetcher.messages.length,
              itemBuilder: (context, index) {
                if (index < 0 ||
                    index >= widget.messageFetcher.messages.length) {
                  return Container();
                }
                final message = widget.messageFetcher.messages[index];
                final user = message['user'];
                final username = user['username'] ?? 'UniKIT';
                final content = message['content'] ?? '';

                return _buildTelegramStyleMessage(
                  theme,
                  username,
                  content,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Center buildError(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ERROR 401 Not connection",
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 15),
          Text(
            "The waiting time has expired.",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildTelegramStyleMessage(ThemeData theme, String username, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            CreatorWidgets().buildMessageContent(content),
          ],
        ),
      ),
    );
  }
  
}
