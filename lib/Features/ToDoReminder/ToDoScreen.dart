import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ToDoReminder/NotificationServices/NotifyHelper.dart';
import 'package:flutterpractices/Features/ToDoReminder/Themes/ThemeServices.dart';
import 'package:flutterpractices/Features/ToDoReminder/Themes/Themes.dart';
import 'package:flutterpractices/Features/ToDoReminder/ui/Widget/button.dart';
import 'package:flutterpractices/Features/ToDoReminder/add_task_bar.dart';
import 'package:flutterpractices/generated/assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ThemeServices _themeServices = ThemeServices();
  NotifyHelper notifyHelper = NotifyHelper();
  late DateTime _selectedDate = DateTime.now();

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),

          ],
        ),
      ),
    );
  }

_addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: getBoldStyle(fontSize: 20, color: Colors.grey),
        dayTextStyle: getBoldStyle(fontSize: 16, color: Colors.grey),
        monthTextStyle: getBoldStyle(fontSize: 14, color: Colors.grey),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
}

  _addTaskBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: subHeadingStyle,
            ),
            Text(
              "Today",
              style: headingStyle,
            ),
          ],
        ),
        MyButton(
            height: 60, width: 120, label: "+ Add Task", onTap: () => Get.to(AddTaskPage())),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      leading: GestureDetector(
        onTap: () async {
          _themeServices.switchTheme();
          notifyHelper.displayNotification(
              title: "THEME CHANGED",
              body: Get.isDarkMode
                  ? "Light Mode has Being Activated"
                  : "Dark Mode Has been Activated");

          // Schedule notification for 5 seconds later
          await notifyHelper.scheduledNotification(05);

          setState(() {});
        },
        child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 20),
      ),
      actions: const [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(Assets.toDoReminderProfile)),
        SizedBox(width: 20),
      ],
    );
  }
}
