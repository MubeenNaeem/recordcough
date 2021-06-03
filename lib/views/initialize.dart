import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/material.dart';
import 'package:recordcough/global/functions.dart';
import 'package:recordcough/global/global.dart';

class Initialize extends StatefulWidget {
  @override
  _InitializeState createState() => _InitializeState();
}

runTask(int i) async {
  print('$i');
  if (await spaceAvailable()) {
    showNotification();
    record();
  } else {
    sendErrorEmail();
  }
}

// CHECK AVAILABLE SPACE
Future<bool> spaceAvailable() async {
  bool available = (await (DiskSpace.getFreeDiskSpace) / 1024) >= 2;
  return available;
}

class _InitializeState extends State<Initialize> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        initializeTask();
      },
    );
    super.initState();
  }

  void initializeTask() async {
    print('initializeTask STARTED........');
    await AndroidAlarmManager.periodic(
      Duration(days: 1),
      12,
      runTask,
      startAt: DateTime(2021, 6, 4, 0, 0, 0),
      wakeup: true,
      rescheduleOnReboot: true,
    );
    navigate(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('C-App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
