import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';
import 'package:flutter/material.dart';

import '../../bills/bills_view.dart';
import '../../dashboards/dashboards_view.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateDashboard extends HomeState {
  final HomeItem homeItem = HomeItem(
      name: "Dashboard",
      icon: Icons.dashboard,
      principalView: const DashboardsView());

  @override
  List<Object> get props => [homeItem];
}

class HomeStateBills extends HomeState {
  final HomeItem homeItem = HomeItem(
    name: "Bills",
    icon: Icons.list,
    principalView: const BillsView(),
  );

  @override
  List<Object> get props => [homeItem];
}
