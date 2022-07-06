import 'package:flutter_events/domain/data/db_provider.dart';
import 'package:flutter_events/domain/entity/user.dart';
import 'package:sqflite/sqflite.dart';

class AuthAPIProvider {
  // init database
  final database = DBProvider().database;

  Future<dynamic> getUser(String login) async {
    final db = await database;
    var res = await db.query("User", where: "login = ?", whereArgs: [login]);
    return res.isNotEmpty ? User.fromMap(res.first) : Null;
  }

  Future<void> registrationUser(User user) async {
    final db = await database;
    var res = await db.insert('User', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteUser(String login) async {
    final db = await database;
    await db.delete(
      'User',
      where: 'login = ?',
      whereArgs: [login],
    );
  }

  Future<void> updateUser(User user) async {
    final db = await database;
    await db.update(
      'User',
      user.toMap(),
      where: 'login = ?',
      whereArgs: [user.login],
    );
  }
}
