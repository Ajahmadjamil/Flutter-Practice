

import 'package:flutterpractices/Features/ToDoReminder/Models/Task.dart';
import 'package:flutterpractices/Features/ToDoReminder/db/DatabaseHelper.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{

@override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async{
  return await DbHelper.insert(task);
  }

}