import 'package:shared_preferences/shared_preferences.dart';

class SharedDarkTheme {
  final String _sharedKey = "darkTheme";
  Future<SharedPreferences> get _sharedPreferences async =>
      await SharedPreferences.getInstance();

  Future<bool> getLastDarkTheme() async {
    return (await _sharedPreferences).getBool(_sharedKey) ?? false;
  }

  Future<void> setLastDarkTheme(bool mode) async {
    (await _sharedPreferences).setBool(_sharedKey, mode);
  }
}
