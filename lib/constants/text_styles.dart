import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/color_schemes.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// This is a class where all text styles are stored
/// You can then reference them in code with `DATextStyles.someTextStyle`
///

class DATextStyles {
  static final body = GoogleFonts.montserrat(
    color: lightColorScheme.onBackground,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static final h6 = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
}
