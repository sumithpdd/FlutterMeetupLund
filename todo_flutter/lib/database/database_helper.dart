import 'dart:async';
import 'dart:io'; 
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:todo_flutter/util/constants.dart';

import '../models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.make();
  factory DatabaseHelper() => _instance;
  static Database _db;
  DatabaseHelper.make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DBNAME);
    var myDb =
        openDatabase(path, version: Constants.DB_VERSION, onCreate: _onCreate);

    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${Constants.TABLE_NAME} (${Constants.COLUMN_ID} INTEGER PRIMARY KEY autoincrement, "
        "${Constants.COLUMN_TITLE} text not null,${Constants.COLUMN_DETAILS} TEXT, ${Constants.COLUMN_DATE} TEXT , ${Constants.COLUMN_COMPLETED} integer not null );");
  }

  Future<int> insertTask(Task task) async {
    var dbClient = await db;
    int count = await dbClient.insert(Constants.TABLE_NAME, task.toMap());

    return count;
  }

  Future<List> getAllTasks() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} ORDER BY ${Constants.COLUMN_ID} ASC");

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${Constants.TABLE_NAME}"));
    return count;
  }

  Future<Task> getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_ID} = $id");
    if (result == null) return null;
    return new Task.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(Constants.TABLE_NAME,
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [id]);
    return count;
  }

  Future<int> updateItem(Task task) async {
    var dbClient = await db;
    int count = await dbClient.update(Constants.TABLE_NAME, task.toMap(),
        where: "${Constants.COLUMN_ID} = ?", whereArgs: [task.id]);

    return count;
  } 
}
