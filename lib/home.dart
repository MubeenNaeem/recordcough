import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/material.dart';
import 'package:recordcough/functions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

runTask() async {
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

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        initializeNotification();
        showNotification();
        record();
        // initializeTask();
      },
    );
    super.initState();
  }

  void initializeTask() async {
    print('initializeTask STARTED........');
    await AndroidAlarmManager.oneShot(
      Duration(seconds: 2),
      12,
      () {
        print('12 AM');
        runTask();
      },
    );
    // await AndroidAlarmManager.periodic(
    //   Duration(seconds: 15),
    //   1,
    //   () {
    //     runTask(3);
    //     print('3 AM');
    //   },
    //   // startAt: DateTime(2021, 1, 1, 3, 0, 0),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                print('initializeTask STARTED........');
                AndroidAlarmManager.oneShot(
                  Duration(seconds: 0),
                  654,
                  () => print('12 AM'),
                );
              },
              child: Text(
                'Play',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
