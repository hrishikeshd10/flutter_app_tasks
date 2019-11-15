import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'dart:core';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'FlutterTodo';
final String databaseName = "Todo.db";
final String id = 'id';
final String title = 'title';
final String isDone = 'isDone';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);

    var database =
        openDatabase(path, onCreate: initDB, version: 1, onUpgrade: onUpgrade);
    return database;
  }

  onUpgrade(Database database, int olderVersion, int newVersion) {
    if (newVersion > olderVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute('''
    
    CREATE TABLE $tableName (
    
    $id INTEGER PRIMARY KEY,
    $title TEXT,
    $isDone INTEGER
    
    );
    
    ''');
  }
}
