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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  final AppTheme appTheme = AppTheme();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final configurationsCubit = BlocProvider.of<ConfigurationsCubit>(context);

    return BlocBuilder(
        bloc: configurationsCubit,
        builder: (context, state) {
          if (state is LoadedConfigurationsState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: state.darkTheme
                  ? appTheme.themeDataDark
                  : appTheme.themeDataLight,
              locale: state.locale,
              routes: {
                "/": (context) => HomeView(),
                "/bills": (context) => const BillsView(),
                "/bills/edit": (context) => BillsEdit(),
                "/dashboards": (context) => const DashboardsView(),
                "/configurations": (context) => const ConfigurationsView()
              },
              initialRoute: "/",
            );
          } else {
            return Container();
          }
        });
  }
}
