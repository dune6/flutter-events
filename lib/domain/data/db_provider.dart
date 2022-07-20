import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/*
  Класс, который ининциализирует базу данных и даёт к ней доступ
 */
class DBProvider {
  static final DBProvider db = DBProvider();

  Database? _database;

  // геттер на базу
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "user_database.db");
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        return await db.execute(
          'CREATE TABLE User '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'login TEXT, '
          'email TEXT,'
          'password TEXT,'
          'years INTEGER,'
          'gender TEXT,'
          'telegram TEXT, '
          'jsonPersonalEvents TEXT)',
        );
      },
      onOpen: (db) {},
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 2,
    );
  }
}
