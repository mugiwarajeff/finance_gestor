import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bills/bills_view.dart';
import '../../dashboards/dashboards_view.dart';

class HomeCubit extends Cubit<HomeState> {
  int _selectedIndex = 0;

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

  int get selectedIndex => _selectedIndex;

  HomeCubit(BuildContext context) : super(HomeStateInitial()) {
    emit(LoadedHomeState(
        homeItem: HomeItem(
      name: AppLocalizations.of(context)!.dashboard,
      icon: Icons.dashboard,
      principalView: const DashboardsView(),
    )));
  }

  void changeView(int index, BuildContext context) {
    _selectedIndex = index;

    switch (_selectedIndex) {
      case 0:
        emit(LoadedHomeState(
            homeItem: HomeItem(
          name: AppLocalizations.of(context)!.dashboard,
          icon: Icons.dashboard,
          principalView: const DashboardsView(),
        )));
        break;
      case 1:
        emit(LoadedHomeState(
            homeItem: HomeItem(
          name: AppLocalizations.of(context)!.bills,
          icon: Icons.list,
          principalView: const BillsView(),
        )));
        break;
    }
  }
}
