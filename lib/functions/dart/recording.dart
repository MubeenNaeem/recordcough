import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recordcough/functions/dart/generate_file_name.dart';
import 'package:recordcough/functions/dart/send_email.dart';

FlutterAudioRecorder audioRecorder;

Future<void> initRecorder() async {
  Directory appDirectory = await getExternalStorageDirectory();

  // For SDCard, use the below two lines
  // List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
  // var root = storageInfo[1].rootDir;
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
    Future.delayed(Duration(minutes: 30), () async {
      await stopRecording();
      AwesomeNotifications().removeChannel('basic');
    });
  } catch (e) {
    sendErrorEmail();
  }
}
