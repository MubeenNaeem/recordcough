import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recordcough/global/global.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isRecording() {
    int hour = DateTime.now().hour;
    if (hour >= 0 && hour < 6) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
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
