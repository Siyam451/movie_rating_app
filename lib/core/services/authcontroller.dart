import 'package:shared_preferences/shared_preferences.dart';

class AuthController {

  static const _emailKey = "user-email";
  static const _passwordKey = "user-password";
  static const _loginKey = "is-logged-in";

  static String? email;
  static String? password;

  static Future<void> saveUserData(
      String userEmail,
      String userPassword,
      ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_emailKey, userEmail);
    await prefs.setString(_passwordKey, userPassword);
    await prefs.setBool(_loginKey, true);

    email = userEmail;
    password = userPassword;
  }

  static Future<void> getUserData() async {

    final prefs = await SharedPreferences.getInstance();

    email = prefs.getString(_emailKey);
    password = prefs.getString(_passwordKey);
  }

  static Future<bool> isUserLoggedIn() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_loginKey) ?? false;
  }

  static Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    email = null;
    password = null;
  }
}