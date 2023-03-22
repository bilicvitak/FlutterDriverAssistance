import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/color_schemes.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// This is a class where all text styles are stored
/// You can then reference them in code with `DATextStyles.someTextStyle`
///

class DATextStyles {
  static final h1 = GoogleFonts.montserrat(
    fontSize: 82,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  static final h2 = GoogleFonts.montserrat(
    fontSize: 52,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  static final h3 = GoogleFonts.montserrat(
    fontSize: 41,
    fontWeight: FontWeight.w400,
  );

  static final h4 = GoogleFonts.montserrat(
    fontSize: 29,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final h5 = GoogleFonts.montserrat(
    fontSize: 21,
    fontWeight: FontWeight.w400,
  );

  static final h6 = GoogleFonts.montserrat(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static final subtitle1 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static final subtitle2 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static final body1 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static final body2 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final button = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );

  static final caption = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static final overline = GoogleFonts.montserrat(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
