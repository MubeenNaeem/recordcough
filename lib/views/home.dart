import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recordcough/global/functions.dart';
import 'package:recordcough/global/global.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
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

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        // initializeTask();
      },
    );
    super.initState();
  }

  void initializeTask() async {
    print('initializeTask STARTED........');
    await AndroidAlarmManager.oneShot(
      Duration(seconds: 5),
      12,
      runTask,
    );
  }

  bool isRecording() {
    int hour = DateTime.now().hour;
    print(hour);
    if (hour >= 0 && hour <= 6) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('C-App'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                navigate(context, '/info');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isRecording() ? 'Recording Now' : 'Next Recording',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Text(
                isRecording() ? 'Until 6:00 Am' : 'Today at 12 AM',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
