import 'package:recordcough/functions/dart/check_space.dart';
import 'package:recordcough/functions/dart/recording.dart';
import 'package:recordcough/functions/dart/send_email.dart';
import 'package:recordcough/functions/dart/show_notification.dart';

runTask(int i) async {
  print('$i');
  if (await spaceAvailable()) {
    showNotification();
    record();
  } else {
    sendErrorEmail();
  }
}
