import 'package:flutter/material.dart';

import '../../news_screen/creator_widgets.dart';

class Search {

  final String? description;
  final String? title;
  final Widget? content;

  Search({
    required this.title,
    required this.description,
    required this.content,
  });

  factory Search.fromMap(Map<String, dynamic> map) {
    final contentString = map['content'] as String?;

    final description = map['description'] as String?;
    final title = map['title'] as String?;

    return Search(
      title: title,
      description: description,
      content: CreatorWidgets().buildMessageSearchContent(contentString ?? ''),
    );
  }
}
