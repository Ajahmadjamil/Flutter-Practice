import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryProvider with ChangeNotifier {
  static const platform = MethodChannel('com.example.myapp/native');

  String _batteryLevel = "Unknown";
  String get batteryLevel => _batteryLevel;

  Future<void> fetchBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      _batteryLevel = "Battery: $result%";
    } on PlatformException catch (e) {
      _batteryLevel = "Failed: ${e.message}";
    }
    notifyListeners();
  }
}
