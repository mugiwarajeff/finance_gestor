import 'package:finance_gestor/app/features/configurations/bloc/configurations_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:finance_gestor/app/features/configurations/bloc/configurations_cubit.dart';

class ConfigurationsView extends StatelessWidget {
  const ConfigurationsView({super.key});

  final IconData lightModeIcon = Icons.light_mode;
  final IconData darkModeIcon = Icons.dark_mode;
  final IconData flagIcon = Icons.flag;
  final double flagSize = 30;
  @override
  Widget build(BuildContext context) {
    final configurationsCubit = BlocProvider.of<ConfigurationsCubit>(context);

    final String appBarTitle = AppLocalizations.of(context)!.configurations;
    final String themeSwitchText = AppLocalizations.of(context)!.switchTheme;
    final String languageSwitchText = AppLocalizations.of(context)!.language;

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: ListView(children: [
        BlocBuilder(
          bloc: configurationsCubit,
          builder: (context, state) => Card(
              child: ListTile(
            title: Text(themeSwitchText),
            leading: state is LoadedConfigurationsState
                ? (Icon(configurationsCubit.darkTheme
                    ? darkModeIcon
                    : lightModeIcon))
                : null,
            trailing: Switch(
              value: configurationsCubit.darkTheme,
              onChanged: (value) => configurationsCubit.setDarkTheme(value),
            ),
          )),
        ),
        BlocBuilder(
          bloc: configurationsCubit,
          builder: (context, state) => Card(
              child: ListTile(
            title: Text(languageSwitchText),
            leading: Icon(flagIcon),
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: state is LoadedConfigurationsState
                    ? configurationsCubit.locale
                    : null,
                items: configurationsCubit.availableLocales
                    .map((locale) => DropdownMenuItem(
                          value: locale.locale,
                          child: Image.asset(
                            locale.path,
                            height: flagSize,
                          ),
                        ))
                    .toList(),
                onChanged: (value) => configurationsCubit.setLocale(value!),
              ),
            ),
          )),
        ),
      ]),
    );
  }
}
