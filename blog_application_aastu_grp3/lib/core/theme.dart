import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  fontFamily: 'poppins',
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xffF8faff),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
);
