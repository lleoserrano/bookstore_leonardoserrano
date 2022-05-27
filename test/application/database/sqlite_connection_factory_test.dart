import 'package:bookstore_leonardoserrano/application/database/sqlite_connection_factory.dart';
import 'package:bookstore_leonardoserrano/models/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() async {
  sqfliteTestInit();
  final firstUser = UserModel(id: 50, userName: 'Leonardo');
  final secondUser = UserModel(id: 100, userName: 'Rui');
  final sqliteConnectionFactory = SqliteConnectionFactory();
  group('SQLite connection factory ... ', () {
    test(
        'Insert two Users - Checks if the structure supports more than one user',
        () async {
      final db = await sqliteConnectionFactory.openConnection();
      await db.execute('delete from localData');

      await db.insert(
        'localData',
        firstUser.toMap(''),
      );

      await db.insert(
        'localData',
        secondUser.toMap(''),
      );

      var result = await db.query('localData');

      expect(result, [
        firstUser.toMap(''),
        secondUser.toMap(''),
      ]);
    });

    test('Delete USER ID 50 - firstUser', () async {
      final db = await sqliteConnectionFactory.openConnection();

      db.rawDelete('delete from localData where id = ?', [firstUser.id]);

      var result = await db.query('localData');

      expect(result, [
        secondUser.toMap(''),
      ]);
    });

    test('Delete USER ID 100 - secondUser', () async {
      final db = await sqliteConnectionFactory.openConnection();

      db.rawDelete('delete from localData where id = ?', [secondUser.id]);

      var result = await db.query('localData');

      expect(result, []);

      await db.execute('delete from localData');
      await db.close();
    });
  });
}
