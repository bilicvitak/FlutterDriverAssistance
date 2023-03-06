import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

///
/// Our main theme file where all colors,
/// styles and similar are written.
///

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
  ),
  scaffoldBackgroundColor: DAColors.white,
  textTheme: GoogleFonts.robotoTextTheme(),
  cardTheme: const CardTheme(
    color: DAColors.white,
  ),
);
