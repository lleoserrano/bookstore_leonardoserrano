import 'package:bookstore_leonardoserrano/application/auth/auth_provider.dart';
import 'package:bookstore_leonardoserrano/application/database/sqlite_connection_factory.dart';
import 'package:bookstore_leonardoserrano/repositories/database_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// TODO

/// Initialize sqflite for test.
void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() async {
  sqfliteTestInit();
  final sqliteConnectionFactory = SqliteConnectionFactory();
  final authProvider = AuthProvider();
  final repository = DatabaseRepositoryImpl(
    sqliteConnectionFactory: sqliteConnectionFactory,
    authProvider: authProvider,
  );
  //Get user
  await authProvider.initialLoad();

  group('Database repository impl ... ', () {
    test('Save ID "teste" and Check content', () async {
      await repository.save('teste');

      var result = await repository.checkContainId('teste');
      expect(true, result);
    });

    test('Remove ID "teste" and Check content', () async {
      //The "updateListFav" method adds an ID if it doesn't exist, if it does, remove it.
      await repository.updateListFav('teste');
      var result = await repository.checkContainId('teste');
      expect(false, result);
    });

    test('Check if contain ID "testeERROR" ', () async {
      var result = await repository.checkContainId('testeERROR');
      expect(false, result);
    });
  });
}
