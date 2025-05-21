import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterpractices/Features/ToDoReminder/Controllers/TaskController.dart';
import 'package:flutterpractices/Features/ToDoReminder/Models/Task.dart';
import 'package:flutterpractices/Features/ToDoReminder/NotificationServices/NotifyHelper.dart';
import 'package:flutterpractices/Features/ToDoReminder/Themes/ThemeServices.dart';
import 'package:flutterpractices/Features/ToDoReminder/Themes/Themes.dart';
import 'package:flutterpractices/Features/ToDoReminder/ui/Widget/TaskTile.dart';
import 'package:flutterpractices/Features/ToDoReminder/ui/Widget/button.dart';
import 'package:flutterpractices/Features/ToDoReminder/add_task_bar.dart';
import 'package:flutterpractices/generated/assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    _taskController.getTask();
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
            const SizedBox(height: 12),
            _showTasks(),
          ],
        ),
      ),
    );
  }

  _addDateBar() {
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
          setState(() {
            _selectedDate = date;
          });

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
            height: 60,
            width: 120,
            label: "+ Add Task",
            onTap: () async {
              await Get.to(const AddTaskPage());
              _taskController.getTask();
            }),
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
          // await notifyHelper.scheduledNotification(05);

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

  _showTasks() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            Task task = _taskController.taskList[index];
            if(task.repeat=="Daily") {
              DateTime parsedTime = parseCustomTime(task.startTime.toString());

              notifyHelper.scheduledNotification(
                parsedTime.hour,
                parsedTime.minute,
                task,
              );
              return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: InkWell(
                    onTap: () {
                      _showBottomSheet(
                          context, task);
                    },
                    child: TaskTile(task),
                  ),
                ),
              ),
            );
            }
            else if(task.date==DateFormat.yMd().format(_selectedDate)){
              DateTime parsedTime = parseCustomTime(task.startTime.toString());
              notifyHelper.scheduledNotification(
                parsedTime.hour,
                parsedTime.minute,
                task,
              );

              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        _showBottomSheet(
                            context, task);
                      },
                      child: TaskTile(task),
                    ),
                  ),
                ),
              );
            }else{
              return Container();
            }
          });
    }));
  }


  DateTime parseCustomTime(String timeStr) {
    try {
      final parts = timeStr.split(' ');
      if (parts.length != 2) throw const FormatException("Invalid time format");

      final time = parts[0]; // e.g. "06:00"
      final meridiem = parts[1]; // "AM" or "PM"

      final timeParts = time.split(':');
      if (timeParts.length != 2) {
        throw FormatException("Invalid hour:minute format");
      }

      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      // Convert to 24-hour format
      if (meridiem == "PM" && hour != 12) {
        hour += 12;
      } else if (meridiem == "AM" && hour == 12) {
        hour = 0;
      }

      return DateTime(0, 1, 1, hour, minute);
    } catch (e) {
      print("Manual parsing error: $e");
      rethrow;
    }
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      width: double.infinity,
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          Column(
            children: [
              if (task.isCompleted != 1)
                _bottomSheetButton(
                  label: "Task Completed",
                  onTap: () {
                    _taskController.markTaskCompleted(task.id!);
                    Get.back();
                  },
                  clr: primaryClr,
                  context: context,
                ),
              _bottomSheetButton(
                label: "Delete Task",
                onTap: () {
                  _taskController.delTask(task);
                  _taskController.getTask();
                  Get.back();
                },
                clr: Colors.red[300]!,
                context: context,
              ),
              _bottomSheetButton(
                label: "Close",
                onTap: () {
                  Get.back();
                },
                clr: Colors.red[300]!,
                context: context,
                isClose: true,
              ),
              const SizedBox(height: 20),
            ],
          )
,
        ],
      ),
    ));
  }

  _bottomSheetButton(
      {required String label,
        required Function()? onTap,
        required Color clr,
        bool isClose = false,
        required BuildContext context}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose ? (Get.isDarkMode ? Colors.grey[600] : Colors.white) : clr,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: isClose == true? Get.isDarkMode?Colors.grey[600]!:Colors.grey[300]!: clr,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? getTitleStyle.copyWith(
                color: Get.isDarkMode ? Colors.white : Colors.black)
                : getTitleStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
