import 'package:flutter_events/domain/data/db_provider.dart';
import 'package:flutter_events/domain/entity/user/user_entity.dart';
import 'package:flutter_events/exceptions/db_exceptions.dart';

class DatabaseCrudProvider {
  // init database
  final DBProvider dbProvider;

  DatabaseCrudProvider({required this.dbProvider});

  Future<UserEntity> getUserByLogin(String login) async {
    final db = await dbProvider.database;
    var res = await db.query("User", where: "login = ?", whereArgs: [login]);
    return res.isNotEmpty
        ? UserEntity.userEntityFromMap(res.first)
        : throw UserDoesNotExist();
  }

  Future<void> addUser(Map<String, dynamic> userMap) async {
    final db = await dbProvider.database;
    var res = await db.query("User",
        where: "login = ?", whereArgs: [userMap['login'] as String]);
    if (res.isNotEmpty) {
      throw UserAlreadyExist();
    } else {
      await db.insert('User', userMap);
    }
  }

  Future<void> updateUser(Map<String, dynamic> userMap) async {
    final db = await dbProvider.database;
    await db.update(
      'User',
      userMap,
      where: 'login = ?',
      whereArgs: [userMap['login'] as String],
    );
  }
}
