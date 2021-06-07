import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

showNotification() {
  initializeNotification();
  FlutterRingtonePlayer.playNotification();
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'basic',
      title: 'Recording...',
      body: 'Recording In Progress...',
    ),
  );
}

void initializeNotification() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic',
        channelName: 'name',
        channelDescription: 'description',
        defaultColor: Colors.blue,
        ledColor: Colors.white,
      )
    ],
  );

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
