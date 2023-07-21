import 'package:finance_gestor/app/features/drawer/drawer_view.dart';
import 'package:finance_gestor/app/features/home/bloc/home_cubit.dart';
import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = HomeCubit(context);
    return BlocBuilder(
        bloc: homeCubit,
        builder: (context, homeState) {
          if (homeState is HomeStateInitial) {
            return Container();
          } else if (homeState is LoadedHomeState) {
            return Scaffold(
                appBar: AppBar(title: Text(homeState.homeItem.name)),
                drawer: const DrawerView(),
                body: homeState.homeItem.principalWidget,
                bottomNavigationBar: BottomNavigationBar(
                  items: homeCubit.getBottomNavigationBarItens(context),
                  onTap: (value) => homeCubit.changeView(value, context),
                  currentIndex: homeCubit.selectedIndex,
                ));
          } else {
            return Container();
          }
        });
  }
}
