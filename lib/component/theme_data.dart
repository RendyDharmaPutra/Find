import 'package:contact_app/component/theme/appbar_theme.dart';
import 'package:contact_app/component/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return
    ThemeData(
      useMaterial3: true,
      primaryColor: const Color.fromARGB(255, 66, 165, 245),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 66, 165, 245)),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      textTheme: TextTheme(
        headlineMedium: appBarTitle,
        titleLarge: title,
        titleMedium: subtitle,
        displayMedium: listTitle,
        displaySmall: listSubtitle,
      ),

    );
}