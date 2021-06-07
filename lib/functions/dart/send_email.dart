import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:recordcough/functions/dart/generate_file_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

sendErrorEmail() async {
  AwesomeNotifications().removeChannel('basic');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString('username');

  String email = 'docjo.sup@gmail.com';
  String password = 'qzmp0581';

  final server = gmail(email, password);

  final message = Message()
    ..from = Address(email, 'Developer')
    // ..recipients.add('mubeen.naeem138@gmail.com')
    ..recipients.add('support@docjo.de')
    ..subject = 'Failed Recording'
    ..text = 'The following scheduled recordings failed for $username'
        '  - ${getFileName()}.wav';

  try {
    final sendReport = await send(message, server);
  } on MailerException catch (e) {
    for (var p in e.problems) {
      print(p.msg);
    }
  }
  var connection = PersistentConnection(server);
  await connection.send(message);
  await connection.close();
}
