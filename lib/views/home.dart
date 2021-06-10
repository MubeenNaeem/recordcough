import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:recordcough/global/global.dart';
import 'package:recordcough/widgets/button.dart';

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
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   isRecording() ? 'Recording Now' : 'Next Recording',
                //   style: TextStyle(
                //     fontSize: 28,
                //   ),
                // ),
                // Text(
                //   isRecording() ? 'Until 6:00 Am' : 'Today at 12 AM',
                //   style: TextStyle(
                //     fontSize: 20,
                //   ),
                // ),
                Button(
                  text: 'Start Recording',
                  onPressed: () {
                    navigate(context, '/recording');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
