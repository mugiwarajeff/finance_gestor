import 'package:finance_gestor/database/database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUp(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  test("Should Return a database Instance", () async {
    await DatabaseHelper.initDatabase();
    Database database = DatabaseHelper.database;
    expect(database, isA<Database>());
  });
}
