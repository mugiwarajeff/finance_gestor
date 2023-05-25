import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeDataLight = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.yellow,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          color: Colors.yellow,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, backgroundColor: Colors.yellow));

  ThemeData themeDataDark = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.yellow,
    brightness: Brightness.dark,
  );
}

/**
 *  const AppBarTheme(
        color: Colors.yellow,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: IconThemeData(color: Colors.black))
 */
