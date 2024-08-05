import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:unikit/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/widgets.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Uri vkUrl = Uri.parse('https://vk.com/unikitpage');
  final Uri telegramUrl = Uri.parse('https://t.me/ukit_college');

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final List<String> carouselImages = [
    'assets/images/banners/flutter.png',
    'assets/images/banners/pr.png',
    'assets/images/banners/tel.png',
    'assets/images/banners/open_door.png'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.71,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    S.of(context).adress,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: ImageCarousel(
                      imageAssetPaths: carouselImages,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium,
                        text: S.of(context).about
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    S.of(context).social_network,
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/url/vk.png', width: 50, height: 50),
                  onPressed: () {
                    _launchURL(vkUrl);
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/images/url/tel.png', width: 50, height: 50),
                  onPressed: () {
                    _launchURL(telegramUrl);
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}