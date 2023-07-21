import 'package:finance_gestor/app/features/drawer/drawer_view.dart';
import 'package:finance_gestor/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  final HomeController homeController = HomeController();

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(widget.homeController.getHomeTilte(context))),
        drawer: const DrawerView(),
        body: widget.homeController.getHomeContent(context),
        bottomNavigationBar: BottomNavigationBar(
          items: widget.homeController.getBottomNavigationBarItens(context),
          onTap: (value) => setState(() {
            widget.homeController.selectedIndex = value;
          }),
          currentIndex: widget.homeController.selectedIndex,
        ));
  }
}
