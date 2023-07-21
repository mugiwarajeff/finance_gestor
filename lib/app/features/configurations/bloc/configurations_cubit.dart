import 'package:finance_gestor/app/features/configurations/bloc/configurations_states.dart';
import 'package:finance_gestor/app/features/configurations/models/available_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigurationsCubit extends Cubit {
  bool darkTheme = false;

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

  late Locale locale;

  ConfigurationsCubit() : super(InitialConfigurationsState()) {
    locale = availableLocales.first.locale;
    emit(LoadedConfigurationsState(darkTheme: false, locale: locale));
  }

  void setDarkTheme(bool newValue) {
    darkTheme = newValue;
    emit(LoadedConfigurationsState(darkTheme: darkTheme, locale: locale));
  }

  void setLocale(Locale newLocale) {
    locale = newLocale;
    emit(LoadedConfigurationsState(darkTheme: darkTheme, locale: locale));
  }
}
