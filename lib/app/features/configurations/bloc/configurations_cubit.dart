import 'package:finance_gestor/app/features/configurations/bloc/configurations_states.dart';
import 'package:finance_gestor/app/features/configurations/models/available_locale.dart';
import 'package:finance_gestor/app/shared/shared_prefferences/shared_dark_theme.dart';
import 'package:finance_gestor/app/shared/shared_prefferences/shared_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigurationsCubit extends Cubit {
  final SharedDarkTheme _sharedDarkTheme = SharedDarkTheme();
  final SharedLocale _sharedLocale = SharedLocale();

  List<AvailableLocale> availableLocales = [
    AvailableLocale(
        path: "lib/app/shared/assets/images/flag_usa.png",
        locale: const Locale("en", "US")),
    AvailableLocale(
      path: "lib/app/shared/assets/images/flag_br.png",
      locale: const Locale("pt", "BR"),
    ),
    AvailableLocale(
      path: "lib/app/shared/assets/images/flag_esp.png",
      locale: const Locale("es", "ES"),
    )
  ];

  bool _darkTheme = false;

  late Locale _locale;

  ConfigurationsCubit() : super(InitialConfigurationsState()) {
    _loadConfigs().then(
      (_) => emit(
          LoadedConfigurationsState(darkTheme: _darkTheme, locale: _locale)),
    );
  }

  Future<void> _loadConfigs() async {
    _darkTheme = await _sharedDarkTheme.getLastDarkTheme();
    _locale = await _sharedLocale.getLastLocale();

    print(_darkTheme);
    print(_locale);
  }

  void setDarkTheme(bool newValue) {
    _darkTheme = newValue;
    _sharedDarkTheme.setLastDarkTheme(_darkTheme);
    emit(LoadedConfigurationsState(darkTheme: _darkTheme, locale: _locale));
  }

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    _sharedLocale.setLastLocale(_locale);
    emit(LoadedConfigurationsState(darkTheme: _darkTheme, locale: _locale));
  }
}
