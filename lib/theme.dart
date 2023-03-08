import 'package:flutter/material.dart';
import 'package:flutter_driver_assistance/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.g.dart';

///
/// Our main theme file where all colors,
/// styles and similar are written.
///

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.montserratTextTheme(),
  colorScheme: lightColorScheme,
  navigationBarTheme: const NavigationBarThemeData().copyWith(
    iconTheme: MaterialStateProperty.all(
      const IconThemeData().copyWith(
        size: 24.h,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.montserratTextTheme(),
  colorScheme: darkColorScheme,
);
