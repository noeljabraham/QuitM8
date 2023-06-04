import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool progressNotificationEnabled = false;

  Future<void> initialize() async {
    final initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final initializationSettingsIOS = DarwinInitializationSettings();
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> scheduleProgressNotification() async {
    if (!progressNotificationEnabled) {
      return;
    }

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'progress_channel',
      'Progress Notification',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      channelShowBadge: false,
      playSound: true,
      enableVibration: true,
      enableLights: true,
      color: Colors.blue,
      fullScreenIntent: false,
      channelAction: AndroidNotificationChannelAction.createIfNotExists,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Stay Strong and Be Strong!',
      'Keep going, you are making progress!',
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
    );
  }

  Future<void> cancelScheduledNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> saveProgressNotificationState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('progressNotification', value);
  }

  Future<void> loadProgressNotificationState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? notificationState = prefs.getBool('progressNotification');
    progressNotificationEnabled = notificationState ?? false;
  }

  void toggleProgressNotification(bool value) async {
    progressNotificationEnabled = value;
    await saveProgressNotificationState(value);

    if (value) {
      await scheduleProgressNotification();
      debugPrint('Progress Notification enabled');
    } else {
      await cancelScheduledNotifications();
      debugPrint('Progress Notification disabled');
    }
  }
}
