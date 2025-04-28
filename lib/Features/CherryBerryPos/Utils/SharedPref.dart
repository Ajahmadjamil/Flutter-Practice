
import 'package:shared_preferences/shared_preferences.dart';


class SharedPref {

  Future<void> setLoginResponse(String loginResponse) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('login', loginResponse);
  }
  Future<String> getLoginResponse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('login') ?? '';
  }


  Future<void> setBearerToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('bearerToken', token);
  }

  Future<String> getBearerToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('bearerToken') ?? '';
  }


}
