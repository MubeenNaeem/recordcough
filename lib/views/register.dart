import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recordcough/global/global.dart';
import 'package:recordcough/widgets/button.dart';
import 'package:recordcough/widgets/snackbar.dart';
import 'package:recordcough/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();

  void register() async {
    String username = usernameController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (username != '') {
      prefs.setString('first', 'no');
      prefs.setString('username', username);
      navigate(context, '/initialize');
    } else {
      showSnackBar(context, 'Enter Username');
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), permission);
    super.initState();
  }

  void permission() async {
    var audio = await Permission.microphone.status;
    var storage = await Permission.storage.status;

    if (audio.isDenied ||
        audio.isUndetermined ||
        audio.isRestricted ||
        storage.isDenied ||
        storage.isUndetermined ||
        storage.isRestricted) {
      var request = await Permission.microphone.request();
      var request2 = await Permission.storage.request();
      if (request.isGranted && request2.isGranted) {
        register();
      }
    } else if (audio.isGranted && audio.isGranted) {
      register();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Username',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  MyTextField(
                    hint: 'Username',
                    controller: usernameController,
                  ),
                  SizedBox(height: 16),
                  Button(
                    text: 'REGISTER',
                    onPressed: permission,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
