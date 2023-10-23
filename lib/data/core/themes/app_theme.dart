import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_app/data/core/constants/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColorDark),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily
  );
}