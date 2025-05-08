import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ToDoReminder/db/DatabaseHelper.dart';
import 'package:flutterpractices/FeaturesScreen.dart';
import 'package:flutterpractices/firebase_options.dart';
import 'package:flutterpractices/pr.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'Features/ToDoReminder/Themes/ThemeServices.dart';
import 'Features/ToDoReminder/Themes/Themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().themes, // set global theme mode
      home: const FeaturesScreen(),
      // home: const MyHomePage(),
    );
  }
}