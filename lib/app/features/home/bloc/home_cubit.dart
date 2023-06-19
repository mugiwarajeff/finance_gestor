import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
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
    emit(HomeStateDashboard());
  }

  void changeView(int index) {
    _selectedIndex = index;

    switch (_selectedIndex) {
      case 0:
        emit(HomeStateDashboard());
        break;
      case 1:
        emit(HomeStateBills());
        break;
    }
  }
}
