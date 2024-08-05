import 'package:flutter/material.dart';
import 'package:unikit/ui/news_screen/video_player.dart';

class CreatorWidgets  {

  Widget buildMessageContent(String content) {
    final widgets = <Widget>[];
    final imageRegExp = RegExp(r'!\[Image\]\((.*?)\)');
    final videoRegExp = RegExp(r'\[Video\]\((.*?)\)');
    final imageMatches = imageRegExp.allMatches(content);
    final videoMatches = videoRegExp.allMatches(content);

    final uniqueUrls = <String>{};
    for (final match in imageMatches) {
      final url = match.group(1);
      if (url != null && uniqueUrls.add(url)) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                url,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/url/no_image.png");
                },
              ),
            ),
          ),
        );
      }
    }

    for (final match in videoMatches) {
      final url = match.group(1);
      if (url != null && uniqueUrls.add(url)) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: VideoPlayerWidget(url: url),
            ),
          ),
        );
      }
    }

    final text = content
        .replaceAll(imageRegExp, '')
        .replaceAll(videoRegExp, '')
        .trim();
    if (text.isNotEmpty) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(text),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
  Widget buildMessageSearchContent(String content) {
    final widgets = <Widget>[];
    final imageRegExp = RegExp(r'!\[Image\]\((.*?)\)');
    final videoRegExp = RegExp(r'\[Video\]\((.*?)\)');
    final imageMatches = imageRegExp.allMatches(content);

    String? imageUrl;
    for (final match in imageMatches) {
      final url = match.group(1);
      if (url != null) {
        imageUrl = url;
        break; // Берем только первое изображение
      }
    }

    final text = content
        .replaceAll(imageRegExp, '')
        .replaceAll(videoRegExp, '')
        .trim();

    if (text.isNotEmpty || imageUrl != null) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (text.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: Text(text, style: const TextStyle(fontSize: 10),),
                    ),
                  ),
                if (imageUrl != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        width: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/url/no_image.png",
                            width: 150,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

