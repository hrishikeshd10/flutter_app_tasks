import 'package:flutter_app_tasks/Models/Database/Database.dart';

import '../Task.dart';

class TaskDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createTask(Task task) async {
    final db = await dbProvider.database;
    var result = db.insert(tableName, task.toDatabaseJSON());
    return result;
  }
}
