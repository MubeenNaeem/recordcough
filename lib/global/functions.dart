import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

// NOTIFICATION
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

// AUDIO RECORDING
FlutterAudioRecorder audioRecorder;

Future<void> initRecorder() async {
  Directory appDirectory = await getExternalStorageDirectory();
  // List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
  // var root = storageInfo[0].rootDir;
  String filePath = appDirectory.path + '/' + getFileName() + '.wav';

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
  try {
    await initRecorder();
    await startRecording();
    Future.delayed(Duration(minutes: 1), () async {
      await stopRecording();
      AwesomeNotifications().removeChannel('basic');
    });
  } catch (e) {
    sendErrorEmail();
  }
}

String getFileName() {
  DateTime time = DateTime.now();
  DateFormat format = DateFormat('dd-MM-yyyy hh:mm:ss a');
  return '${format.format(time)}';
}

sendErrorEmail() async {
  AwesomeNotifications().removeChannel('basic');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString('username');

  String email = 'docjo.sup@gmail.com';
  String password = 'qzmp0581';

  final server = gmail(email, password);

  final message = Message()
    ..from = Address(email, 'Developer')
    // ..recipients.add('mubeen.naeem138@gmail.com')
    ..recipients.add('support@docjo.de')
    ..subject = 'Failed Recording'
    ..text = 'The following scheduled recordings failed for $username'
        '  - ${getFileName()}.wav';

  try {
    final sendReport = await send(message, server);
  } on MailerException catch (e) {
    for (var p in e.problems) {
      print(p.msg);
    }
  }
  var connection = PersistentConnection(server);
  await connection.send(message);
  await connection.close();
}
