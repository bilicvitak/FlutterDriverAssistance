import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

///
/// This is a class where all text styles are stored
/// You can then reference them in code with `DATextStyles.someTextStyle`
///

class DATextStyles {
  static final body = GoogleFonts.montserrat(
    color: DAColors.onPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
