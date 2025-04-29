import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  Future<void> setDriverInfo(String registrationNo, String name, String locationDocPath) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Store data as a JSON string using a Map
    Map<String, String> driverInfo = {
      'RegistrationNo': registrationNo,
      'name': name,
      'locationDocPath': locationDocPath,
    };

    await sharedPreferences.setString('driverInfo', jsonEncode(driverInfo));
  }

  Future<Map<String, String>> getDriverInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String driverInfoString = sharedPreferences.getString('driverInfo') ?? '{}';

    // Decode JSON into a Map
    Map<String, dynamic> driverInfo = jsonDecode(driverInfoString);

    return {
      'RegistrationNo': driverInfo['RegistrationNo'] ?? '',
      'name': driverInfo['name'] ?? '',
      'locationDocPath': driverInfo['locationDocPath'] ?? '',
    };
  }

  Future<void> clearDriverInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('driverInfo'); // Remove only driver info
  }


}
