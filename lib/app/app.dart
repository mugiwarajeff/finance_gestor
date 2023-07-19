import 'package:finance_gestor/app/features/bills/bills_edit.dart';
import 'package:finance_gestor/app/features/bills/bills_view.dart';
import 'package:finance_gestor/app/features/configurations/bloc/configurations_cubit.dart';
import 'package:finance_gestor/app/features/configurations/bloc/configurations_states.dart';
import 'package:finance_gestor/app/features/configurations/configurations_view.dart';
import 'package:finance_gestor/app/features/dashboards/dashboards_view.dart';
import 'package:finance_gestor/app/features/home/home_view.dart';
import 'package:finance_gestor/app/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final AppTheme appTheme = AppTheme();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final configurationsCubit = BlocProvider.of<ConfigurationsCubit>(context);

    return BlocBuilder(
      bloc: configurationsCubit,
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state is LoadedConfigurationsState
            ? (state.darkTheme
                ? appTheme.themeDataDark
                : appTheme.themeDataLight)
            : null,
        locale: Locale("pt"),
        routes: {
          "/": (context) => HomeView(),
          "/bills": (context) => const BillsView(),
          "/bills/edit": (context) => BillsEdit(),
          "/dashboards": (context) => const DashboardsView(),
          "/configurations": (context) => const ConfigurationsView()
        },
        initialRoute: "/",
      ),
    );
  }
}
