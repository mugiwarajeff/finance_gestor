import 'package:flutter/material.dart';

abstract class ConfigurationsState {}

class InitialConfigurationsState extends ConfigurationsState {}

class LoadedConfigurationsState extends ConfigurationsState {
  final bool darkTheme;
  final Locale locale;

  LoadedConfigurationsState({required this.darkTheme, required this.locale});
}
