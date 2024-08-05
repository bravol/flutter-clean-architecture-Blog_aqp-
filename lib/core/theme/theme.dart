import 'package:fca_blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class Apptheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _border(),
        focusedBorder: _border(AppPallete.gradient2),
        contentPadding: const EdgeInsets.all(27),
      ),
      appBarTheme:
          const AppBarTheme(backgroundColor: AppPallete.backgroundColor));
}
