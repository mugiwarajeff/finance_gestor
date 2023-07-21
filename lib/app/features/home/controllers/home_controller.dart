
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bills/bills_view.dart';
import '../../dashboards/dashboards_view.dart';

class HomeController {
  int selectedIndex = 0;

  List<BottomNavigationBarItem> getBottomNavigationBarItens(
          BuildContext context) =>
      [
        BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.dashboard),
        BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: AppLocalizations.of(context)!.bills)
      ];

  String getHomeTilte(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return AppLocalizations.of(context)!.dashboard;
      case 1:
        return AppLocalizations.of(context)!.bills;
    }

    return "";
  }

  Widget getHomeContent(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const DashboardsView();
      case 1:
        return const BillsView();
    }

    return Container();
  }
}
