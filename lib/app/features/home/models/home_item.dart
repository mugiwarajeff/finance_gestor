import 'package:flutter/material.dart';

class HomeItem {
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
}
