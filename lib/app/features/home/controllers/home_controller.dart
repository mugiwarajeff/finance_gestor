import 'package:finance_gestor/app/features/bills/bills_view.dart';
import 'package:finance_gestor/app/features/dashboards/dashboards_view.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
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

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeSelectedItem(int indexSelected) {
    _selectedIndex = indexSelected;
    notifyListeners();
  }

  Widget getSelectedView(int indexSelected) {
    return _homeItens.elementAt(indexSelected).principalWidget;
  }

  String getSelectedTitle(int indexSelected) {
    return _homeItens.elementAt(indexSelected).name;
  }

  List<BottomNavigationBarItem> get homeBottomBars => _homeItens
      .map((HomeItem homeItem) => homeItem.bottomNavigationBarItem)
      .toList();
}
