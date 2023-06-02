import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bills/bills_view.dart';
import '../../dashboards/dashboards_view.dart';

class HomeCubit extends Cubit<HomeState> {
  final List<HomeItem> _homeItens = <HomeItem>[
    HomeItem(
        name: "Dashboard",
        icon: Icons.dashboard,
        principalView: const DashboardsView()),
    HomeItem(
      name: "Bills",
      icon: Icons.list,
      principalView: const BillsView(),
    )
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItens =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "Bills")
  ];

  int _selectedIndex = 0;

  List<BottomNavigationBarItem> get bottomNavigationBarItens =>
      _bottomNavigationBarItens;

  int get selectedIndex => _selectedIndex;

  HomeCubit() : super(HomeStateInitial()) {
    emit(HomeStateLoaded(homeItem: _homeItens.elementAt(_selectedIndex)));
  }

  void changeView(int index) {
    _selectedIndex = index;
    emit(HomeStateLoaded(homeItem: _homeItens.elementAt(_selectedIndex)));
  }
}
