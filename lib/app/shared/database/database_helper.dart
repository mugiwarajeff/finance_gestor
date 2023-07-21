import 'package:finance_gestor/app/shared/database/daos/bills_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<String> get _databaseDir async => await getDatabasesPath();
  static const String _databaseName = "database.db";
  static const int databaseVersion = 3;
  static Database? _database;

  DatabaseHelper._();

  static Database get database {
    try {
      return _database!;
    } on Exception {
      throw Exception("Try to initiate the database instance");
    }
  }

  static Future<void> initDatabase() async {
    final String databasePath = join(await _databaseDir, _databaseName);

    _database = await openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute(BillsDAO.billsSql);
      },
      onUpgrade: (db, oldVersion, newVersion) => deleteDatabase(databasePath),
      onDowngrade: (db, oldVersion, newVersion) => deleteDatabase(databasePath),
    );
  }
}
