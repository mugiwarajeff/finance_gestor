import 'package:finance_gestor/app/features/home/bloc/home_cubit.dart';
import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  final HomeCubit homeCubit = HomeCubit();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: homeCubit,
        builder: (context, homeState) {
          if (homeState is HomeStateInitial) {
            return Container();
          } else if (homeState is LoadedHomeState) {
            return Scaffold(
                appBar: AppBar(title: Text(homeState.homeItem.name)),
                drawer: const Drawer(),
                body: homeState.homeItem.principalWidget,
                bottomNavigationBar: BottomNavigationBar(
                  items: homeCubit.bottomNavigationBarItens,
                  onTap: (value) => homeCubit.changeView(value),
                  currentIndex: homeCubit.selectedIndex,
                ));
          } else {
            return Container();
          }
        });
  }
}
