import 'package:finance_gestor/app/features/bills/bills_view.dart';
import 'package:finance_gestor/app/features/configurations/configurations_view.dart';
import 'package:finance_gestor/app/features/dashboards/dashboards_view.dart';
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
      routes: {
        "/": (context) => HomeView(),
        "/bills": (context) => const BillsView(),
        "/bills/edit": (context) => const BillsView(),
        "/dashboards": (context) => const DashboardsView(),
        "/configurations": (context) => const ConfigurationsView()
      },
      initialRoute: "/",
    );
  }
}
