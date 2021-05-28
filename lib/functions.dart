import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

// NOTIFICATION
showNotification() {
  FlutterRingtonePlayer.playNotification();
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'basic',
      title: 'Recording..',
      body: 'In Progress...',
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

// AUDIO RECORDING
FlutterAudioRecorder audioRecorder;
Future<void> initRecorder() async {
  Directory appDirectory = await getExternalStorageDirectory();
  String filePath = appDirectory.path + '/' + '123' + '.wav';

  audioRecorder = FlutterAudioRecorder(
    filePath,
    audioFormat: AudioFormat.WAV,
    sampleRate: 22050,
  );
  await audioRecorder.initialized;
}

Future<void> startRecording() async {
  await audioRecorder.start();
}

Future<void> stopRecording() async {
  await audioRecorder.stop();
}

void record() async {
  await initRecorder();
  await startRecording();
  Future.delayed(Duration(seconds: 10), () async {
    await stopRecording();
  });
}

String getFileName() {
  DateTime time = DateTime.now();
  DateFormat format = DateFormat('dd.MM.yyyy');
  return '${format.format(time)} 12AM';
}

sendErrorEmail() {}
