import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.grey : const Color(0xffF1F5FB),
      indicatorColor:
          isDarkTheme ? Colors.grey: const Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Colors.white10 : Color(0xffF1F5FB),
      hintColor:
          isDarkTheme ? Colors.white70 : const Color(0xffCBDCF8),
      highlightColor:
          isDarkTheme ? Colors.white10 : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? Colors.white10 : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? Colors.white : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Colors.black : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
