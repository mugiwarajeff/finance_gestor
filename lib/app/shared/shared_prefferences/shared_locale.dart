import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocale {
  final String _sharedKey = "locale";
  Future<SharedPreferences> get _sharedPreferences async =>
      await SharedPreferences.getInstance();

  Future<Locale> getLastLocale() async {
    List<String>? localeString =
        (await _sharedPreferences).getStringList(_sharedKey);

    if (localeString != null) {
      return Locale(localeString[0], localeString[1]);
    }

    return const Locale("en", "US");
  }

  Future<void> setLastLocale(Locale lastLocale) async {
    (await _sharedPreferences).setStringList(
        _sharedKey, [lastLocale.languageCode, lastLocale.countryCode!]);
  }
}
