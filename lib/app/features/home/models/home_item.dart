import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeItem extends Equatable {
  late String _name;
  late IconData _icon;

  late Widget _principalView;

  HomeItem(
      {required String name,
      required IconData icon,
      required Widget principalView}) {
    _name = name;
    _icon = icon;
    _principalView = principalView;
  }

  BottomNavigationBarItem get bottomNavigationBarItem =>
      BottomNavigationBarItem(icon: Icon(_icon), label: _name);

  Widget get principalWidget => _principalView;

  String get name => _name;

  @override
  List<Object> get props => [_name, _icon, _principalView];
}
