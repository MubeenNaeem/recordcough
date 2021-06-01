import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recordcough/global/colors.dart';
import 'package:recordcough/views/home.dart';
import 'package:recordcough/views/info.dart';
import 'package:recordcough/views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cough Recording',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.prime,
        scaffoldBackgroundColor: MyColors.white,
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
      ),
      routes: {
        '/': (_) => Container(),
        '/register': (_) => Register(),
        '/home': (_) => Home(),
        '/info': (_) => Info(),
      },
      initialRoute: prefs.getString('first') == null ? '/register' : '/home',
    );
  }
}
