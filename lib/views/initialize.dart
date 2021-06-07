import 'package:flutter/material.dart';
import 'package:recordcough/functions/dart/start_task.dart';
import 'package:recordcough/global/global.dart';

class Initialize extends StatefulWidget {
  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        startAllTasks();
      },
    );
    super.initState();
  }

  startAllTasks() async {
    await startTask(1, 0, 0);
    await startTask(2, 0, 30);
    await startTask(3, 1, 0);
    await startTask(4, 1, 30);
    await startTask(5, 2, 0);
    await startTask(6, 2, 30);
    await startTask(7, 3, 0);
    await startTask(8, 3, 30);
    await startTask(9, 4, 0);
    await startTask(10, 4, 30);
    await startTask(11, 5, 0);
    await startTask(12, 5, 30);
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
