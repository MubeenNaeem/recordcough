import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recordcough/global/colors.dart';
import 'package:recordcough/global/global.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  Button({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      height: 48,
      minWidth: width(context),
      color: MyColors.prime,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(
          fontSize: 18,
          color: MyColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
