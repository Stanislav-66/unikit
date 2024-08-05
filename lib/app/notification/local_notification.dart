import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsManager {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final String? routeAddress;

  LocalNotificationsManager({this.routeAddress}) {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  Future<void> initialize({required BuildContext? context,}) async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        if(context != null)
        {
          AutoRouter.of(context).pushNamed(routeAddress!);
        }
      },
    );
  }

  Future<void> showNotification({
    required String? title,
    required String? body,
    String id = 'id',
    String name = 'Name',
    String description = 'Default Description',
    String ticker = 'ticker',
    required int notificationId,
    String payload = 'default_payload',
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      id,
      name,
      channelDescription: description,
      importance: Importance.max,
      priority: Priority.high,
      ticker: ticker,
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}