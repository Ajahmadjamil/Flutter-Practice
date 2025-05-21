import 'package:flutter/foundation.dart';
import 'package:flutterpractices/Features/ToDoReminder/Models/Task.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "task.db";
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        if (kDebugMode) {
          print("creating a new db");
        }
        return db.execute("CREATE TABLE $_tableName ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title TEXT, "
            "note TEXT, "
            "date TEXT, "
            "startTime TEXT, "
            "endTime TEXT, "
            "remind INTEGER, "
            "repeat TEXT, "
            "color INTEGER, "
            "isCompleted INTEGER);");
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    if (kDebugMode) {
      print("insert function called");
    }
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query func called");
    return await _db!.query(_tableName);
  }

  static deleteTask(Task task) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static update(int id) async{
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id=?

    ''',[1,id]);
  }
}
