// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppPreferences {
//   static const String _KEY_LOGIN = "key_login";
//
//   static Future<void> setLogin(String login) async {
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setString(_KEY_LOGIN, login);
//   }
//
//   static Future<String> getLogin() async {
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getString(_KEY_LOGIN) ?? '';
//   }
// }
