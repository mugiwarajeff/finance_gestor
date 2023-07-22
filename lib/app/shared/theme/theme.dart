import 'package:finance_gestor/app/shared/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeDataLight = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.yellow,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primaryContainer,
        titleTextStyle:
            TextStyle(color: lightColorScheme.onPrimaryContainer, fontSize: 18),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColorScheme.primaryContainer,
        unselectedItemColor: lightColorScheme.onPrimaryContainer,
        selectedItemColor: lightColorScheme.onPrimaryContainer,
      ),
      navigationDrawerTheme: NavigationDrawerThemeData(
          indicatorColor: lightColorScheme.secondaryContainer,
          iconTheme: MaterialStateProperty.all(
              IconThemeData(color: lightColorScheme.onSecondaryContainer)),
          labelTextStyle: MaterialStateProperty.all(
              TextStyle(color: lightColorScheme.onSecondaryContainer))));

  ThemeData themeDataDark = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.yellow,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primaryContainer,
      iconTheme: IconThemeData(color: darkColorScheme.onPrimaryContainer),
      titleTextStyle:
          TextStyle(color: darkColorScheme.onPrimaryContainer, fontSize: 18),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.primaryContainer,
      unselectedItemColor: darkColorScheme.onPrimaryContainer,
      selectedItemColor: darkColorScheme.onPrimaryContainer,
    ),
  );
}

/**
 *  const AppBarTheme(
        color: Colors.yellow,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: IconThemeData(color: Colors.black))
 */
