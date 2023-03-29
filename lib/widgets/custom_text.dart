import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      this.color = whiteColor,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
