import 'dart:convert';


import 'package:dio/dio.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:unikit/app/notification/local_notification.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final Dio _dio = Dio();
  int notificationId = 0;
  late LocalNotificationsManager notificationsManager;
  final BuildContext context;

  NotificationService(this.context);

  Future<void> initialize() async {
    NotificationSettings settings = await _fcm.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Уведомления разрешены');
    } else {
      print('Уведомления не разрешены');
    }

    String? token = await _fcm.getToken();
    print("FCM Token: $token");

    if (token != null) {
      await sendTokenToServer(token);
    } else {
      print('Не удалось получить FCM токен');
    }

    notificationsManager = LocalNotificationsManager(routeAddress: '/news');
    await notificationsManager.initialize(context: context);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _onMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> sendTokenToServer(String token) async {
    try {
      final response = await _dio.post(
        'http://95.165.109.146:8080/saveToken',
        data: jsonEncode({'token': token}),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        print('FCM токен отправлен на сервер успешно');
      } else {
        print('Ошибка при отправке FCM токена на сервер: ${response.data}');
      }
    } catch (e) {
      print('Ошибка при отправке FCM токена на сервер: $e');
    }
  }

  Future<void> _onMessage(RemoteMessage message) async {
    notificationId++;
    await notificationsManager.showNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      notificationId: notificationId,
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final notificationsManager = LocalNotificationsManager(routeAddress: '/destination');
  await notificationsManager.initialize(context: null);
  int notificationId = DateTime.now().millisecondsSinceEpoch;
  await notificationsManager.showNotification(
    title: message.notification?.title,
    body: message.notification?.body,
    notificationId: notificationId,
  );
}