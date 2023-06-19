import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bills/bills_view.dart';
import '../../dashboards/dashboards_view.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeItem _billState = HomeItem(
      name: "Bills", icon: Icons.list, principalView: const BillsView());
  final HomeItem _dashboardState = HomeItem(
      name: "Dashboard",
      icon: Icons.dashboard,
      principalView: const DashboardsView());

  final List<BottomNavigationBarItem> _bottomNavigationBarItens =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "Bills")
  ];

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> get bottomNavigationBarItens =>
      _bottomNavigationBarItens;

  HomeItem get billState => _billState;

  HomeItem get dashboardState => _dashboardState;

  int get selectedIndex => _selectedIndex;

  HomeCubit() : super(HomeStateInitial()) {
    emit(LoadedHomeState(homeItem: _dashboardState));
  }

  void changeView(int index) {
    _selectedIndex = index;

    switch (_selectedIndex) {
      case 0:
        emit(LoadedHomeState(homeItem: _dashboardState));
        break;
      case 1:
        emit(LoadedHomeState(homeItem: _billState));
        break;
    }
  }
}
