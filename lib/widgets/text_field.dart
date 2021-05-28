import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recordcough/global/colors.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  MyTextField({
    this.hint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey, width: 0.3),
      ),
      child: TextField(
        style: GoogleFonts.nunitoSans(),
        controller: controller,
        cursorColor: MyColors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(14),
          hintText: hint,
          hintStyle: GoogleFonts.nunitoSans(fontSize: 15),
        ),
      ),
    );
  }
}
