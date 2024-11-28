import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  final SharedPreferences _sharedPreferences;
  AppPref(this._sharedPreferences);

  Future setToken(String token) async {
    await _sharedPreferences.setString(PrefKey.token.name, token);
  }

  String getToken() {
    return _sharedPreferences.getString(PrefKey.token.name) ?? '';
  }

  void removeToken() {
    _sharedPreferences.remove(PrefKey.token.name);
  }
}

enum PrefKey { token }
