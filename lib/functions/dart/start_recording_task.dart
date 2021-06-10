import 'package:recordcough/functions/dart/check_space.dart';
import 'package:recordcough/functions/dart/record.dart';
import 'package:recordcough/functions/dart/send_email.dart';

startRecordingTask() async {
  if (await spaceAvailable()) {
    // showNotification();
    record();
  } else {
    sendErrorEmail();
  }
}
