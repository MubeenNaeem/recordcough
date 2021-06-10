import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:recordcough/functions/dart/start_recording_task.dart';

Future<void> startTask(id, hours, minutes) async {
  print('startTask.......');
  await AndroidAlarmManager.periodic(
    Duration(days: 1),
    id,
    startRecordingTask,
    startAt: DateTime(2021, 6, 8, hours, minutes, 0),
    wakeup: true,
    rescheduleOnReboot: true,
  );
}
