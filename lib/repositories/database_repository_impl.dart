import '../application/auth/auth_provider.dart';
import '../application/database/sqlite_connection_factory.dart';
import '../models/user/user_model.dart';
import 'database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;
  final AuthProvider _authProvider;

  DatabaseRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
    required AuthProvider authProvider,
  })  : _sqliteConnectionFactory = sqliteConnectionFactory,
        _authProvider = authProvider;

  @override
  Future<void> save(String id) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    if (await _checkContainUser()) {
      //update
      await updateListFav(id);
    } else {
      //insert
      await conn.insert('localData', _authProvider.user.toMap([id].join(';')));
    }
  }

  @override
  Future<void> deleteUserById() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    conn.rawDelete(
        'delete from localData where id = ?', [_authProvider.user.id]);
  }

  @override
  Future<bool> checkContainId(String id) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery(
        'select * from localData where id = ?', [_authProvider.user.id]);

    if (result.isEmpty) {
      //Not contain user
      return false;
    } else {
      final userListFav = UserModel.fromMap(result.first).booksFav.split(';');
      return userListFav.contains(id);
    }
  }

  Future<bool> _checkContainUser() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery(
        'select * from localData where id = ?', [_authProvider.user.id]);

    return result.isNotEmpty;
  }

  @override
  Future<void> updateListFav(String id) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery(
        'select * from localData where id = ?', [_authProvider.user.id]);
    final userListFavUpdate =
        UserModel.fromMap(result.first).booksFav.split(';');

    if (userListFavUpdate.contains(id)) {
      userListFavUpdate.remove(id);
    } else {
      userListFavUpdate.add(id);
    }
    await conn.rawUpdate('update localData set booksFav = ? where id = ?',
        [userListFavUpdate.join(';'), _authProvider.user.id]);
  }
}
