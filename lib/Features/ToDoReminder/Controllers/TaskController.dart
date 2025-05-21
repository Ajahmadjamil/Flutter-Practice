import 'package:flutterpractices/Features/ToDoReminder/Models/Task.dart';
import 'package:flutterpractices/Features/ToDoReminder/db/DatabaseHelper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DbHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delTask(Task task){
    DbHelper.deleteTask(task);
  }

  void markTaskCompleted(int id) async{
    await DbHelper.update(id);
    getTask();

  }
}
