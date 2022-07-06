import 'package:flutter_events/domain/data/db_provider.dart';
import 'package:flutter_events/domain/entity/user.dart';

class AuthAPIProvider {
  // init database
  final database = DBProvider().database;

  Future<int> getLastIndex() async {
    final db = await database;
    var res = await db.query('User');
    if (res.isEmpty) return 0;
    var last = User.fromMap(res.last);
    return last.id;
  }

  Future<User?> getUser(String login) async {
    final db = await database;
    var res = await db.query("User", where: "login = ?", whereArgs: [login]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  Future<bool> registrationUser(User user) async {
    final db = await database;
    var res =
        await db.query("User", where: "login = ?", whereArgs: [user.login]);
    if (res.isNotEmpty) {
      return false;
    } else {
      await db.insert('User', user.toMap());
      return true;
    }
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
