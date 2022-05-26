import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteConnectionFactory {
  // ignore: constant_identifier_names
  static const _VERSION = 1;
  // ignore: constant_identifier_names
  static const _DATABASE_NAME = 'BOOK_STORE_FAV_LIST';
  // ignore: constant_identifier_names
  static const _STRUCT_DATABASE = '''
      create table localData(
        id INTEGER PRIMARY KEY, userName TEXT NOT NULL, booksFav TEXT NOT NULL
      )
    ''';

  static SqliteConnectionFactory? _instance;
  Database? _db;
  
  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);
    if (_db == null) {
      return await openDatabase(
        databasePathFinal,
        version: _VERSION,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowgrade,
      );
    } else {
      return _db!;
    }
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute(_STRUCT_DATABASE);
    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();
    batch.commit();
  }

  Future<void> _onDowgrade(Database db, int oldVersion, int version) async {}
}
