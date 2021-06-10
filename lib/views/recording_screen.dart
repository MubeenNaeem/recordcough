import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:recordcough/functions/dart/show_notification.dart';
import 'package:recordcough/functions/dart/start_recording_task.dart';
import 'package:recordcough/global/colors.dart';
import 'package:wakelock/wakelock.dart';

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  void initState() {
    startRecordings();
    super.initState();
  }

  startRecordings() {
    initializeNotification();
    delayRecording(0);
    delayRecording(30);
    delayRecording(60);
    delayRecording(90);
    delayRecording(120);
    delayRecording(150);
    delayRecording(180);
    delayRecording(210);
    delayRecording(240);
    delayRecording(270);
    delayRecording(300);
    delayRecording(330);
    hideNotification();
  }

  delayRecording(int min) {
    Future.delayed(Duration(minutes: min), () {
      startRecordingTask();
    });
  }

  hideNotification() {
    Future.delayed(
      Duration(minutes: 360),
      () {
        AwesomeNotifications().removeChannel('basic');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return Scaffold(
      backgroundColor: MyColors.black,
      appBar: AppBar(
        backgroundColor: MyColors.black,
      ),
      body: Container(),
    );
  }
}
