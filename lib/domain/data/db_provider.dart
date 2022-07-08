import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider();

  Database? _database;

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
        // Run the CREATE TABLE statement on the database.
        return await db.execute(
          'CREATE TABLE User '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'login TEXT, '
          'email TEXT,'
          'password TEXT,'
          'years INTEGER,'
          'gender TEXT,'
          'telegram TEXT)',
        );
      },
      onOpen: (db) {},
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
