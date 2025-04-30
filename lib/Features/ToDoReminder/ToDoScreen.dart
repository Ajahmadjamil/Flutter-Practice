import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ToDoReminder/NotifyHelper.dart';
import 'package:flutterpractices/Features/ToDoReminder/ThemeServices.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ThemeServices _themeServices = ThemeServices();
  NotifyHelper notifyHelper=NotifyHelper();
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();

    notifyHelper.requestIOSPermissions();
    notifyHelper.requestNotificationPermission();
    notifyHelper.requestAndroidPermissions();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const Column(
        children: [
          Text("Theme Data"),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () async {
          _themeServices.switchTheme();
          notifyHelper.displayNotification(
              title: "THEME CHANGED",
              body: Get.isDarkMode ? "Light Mode has Being Activated" : "Dark Mode Has been Activated"
          );

          // Schedule notification for 5 seconds later
          await notifyHelper.scheduledNotification(05);

          setState(() {});
        },        child: const Icon(Icons.nightlight_round, size: 20),
      ),
      actions: const [
        Icon(Icons.person, size: 20),
        SizedBox(width: 20),
      ],
    );
  }
}
