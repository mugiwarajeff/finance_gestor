import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeDataLight = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.yellow,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          color: Colors.yellow,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 1))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, backgroundColor: Colors.yellow),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ));

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
