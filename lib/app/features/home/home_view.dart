import 'package:finance_gestor/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final String homeTitle = "Home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, homeController, child) => Scaffold(
        appBar: AppBar(
            title: Text(
                homeController.getSelectedTitle(homeController.selectedIndex))),
        drawer: const Drawer(),
        body: homeController.getSelectedView(homeController.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: homeController.homeBottomBars,
          onTap: (value) => homeController.changeSelectedItem(value),
          currentIndex: homeController.selectedIndex,
        ),
      ),
    );
  }
}
