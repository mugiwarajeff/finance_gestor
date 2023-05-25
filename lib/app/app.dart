import 'package:finance_gestor/app/features/home/home_view.dart';
import 'package:finance_gestor/app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final AppTheme appTheme = AppTheme();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.themeDataLight,
      routes: {"/": (context) => const HomeView()},
      initialRoute: "/",
    );
  }
}
