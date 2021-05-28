import 'package:flutter/material.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//navigator
void navigate(BuildContext context, String to, {arguments}) {
  Navigator.of(context).pushNamed(to, arguments: arguments);
}
