import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recordcough/global/colors.dart';

void showSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: MyColors.prime,
      content: Text(
        text,
        style: GoogleFonts.nunitoSans(),
      ),
    ),
  );
}
