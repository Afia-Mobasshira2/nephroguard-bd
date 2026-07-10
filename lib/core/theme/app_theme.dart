import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nephro_guard_bd/core/theme/app_colors.dart';



class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      colorSchemeSeed: AppColors.primary,

      scaffoldBackgroundColor: AppColors.background,

      fontFamily: GoogleFonts.poppins().fontFamily,

      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      cardTheme: CardThemeData(
        elevation: 2,
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.border,
          ),
          borderRadius: BorderRadius.circular(14),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}