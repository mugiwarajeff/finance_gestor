import 'package:finance_gestor/database/daos/bills_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> getDataBase() async {
    final String databaseDir = await getDatabasesPath();
    const String databaseName = "database.db";
    const int databaseVersion = 1;

    final String databasePath = join(databaseDir, databaseName);

    Database database = await openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute(BillsDAO.billsSql);
      },
      onDowngrade: (db, oldVersion, newVersion) => {},
    );

    return database;
  }
}
