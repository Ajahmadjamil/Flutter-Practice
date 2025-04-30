import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = "isDarkMode";

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get themes => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    bool isDark = _loadThemeFromBox();
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!isDark);
  }
}
