import 'package:intl/intl.dart';

String getFileName() {
  DateTime time = DateTime.now();
  DateFormat format = DateFormat('dd-MM-yyyy hh:mm:ss a');
  return '${format.format(time)}';
}
