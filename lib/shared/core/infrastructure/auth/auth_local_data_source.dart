import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this._preferences);
  final SharedPreferences _preferences;

  static const _accessTokenKey = 'access_token';

  Future<String?> readAccessToken() async {
    return _preferences.getString(_accessTokenKey);
  }

  Future<bool> saveAccessToken(String token) async {
    return await _preferences.setString(_accessTokenKey, token);
  }

  Future<bool> deleteAccessToken() async {
    return await _preferences.remove(_accessTokenKey);
  }

  Future<bool> hasAccessToken() async {
    return _preferences.containsKey(_accessTokenKey);
  }
}
