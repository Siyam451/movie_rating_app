import 'package:shared_preferences/shared_preferences.dart';

class AuthController {

  static const _emailKey = "user-email";
  static const _passwordKey = "user-password";

  static String? email;
  static String? password;

  static Future<void> saveUserData(
      String userEmail,
      String userPassword,
      ) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_emailKey, userEmail);
    await prefs.setString(_passwordKey, userPassword);

    email = userEmail;
    password = userPassword;
  }

  static Future<bool> isUserLoggedIn() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_emailKey) != null;
  }

  static Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
  }
}