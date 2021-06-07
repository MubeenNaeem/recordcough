import 'package:flutter/material.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//navigator
void navigate(BuildContext context, String to, {arguments}) {
  Navigator.of(context).pushNamed(to, arguments: arguments);
}
