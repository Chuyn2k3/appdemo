import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static const String _tokenKey = "token";
  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }
}

class StoreLogin {
  static Future<void> setLoginUser(String username, String password) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("username", username);
    await preferences.setString("password", password);
  }

  static Future<String?> getEmail() async {
    final preferences = await SharedPreferences.getInstance();
     return preferences.getString("username");
  }

  static Future<String?> getPassword() async {
    final preferences = await SharedPreferences.getInstance();
     return preferences.getString("password");
  }

  static Future<void> clearLoginUser() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove("username");
    preferences.remove("password");
  }
}
