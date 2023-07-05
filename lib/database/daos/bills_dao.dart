import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class BillsDAO {
  static const String _tableName = "bills";
  static const String _name = "name";
  static const String _value = "value";
  static const String _description = "description";
  static const String _dueDate = "dueDate";
  static const String _paid = "paid";

  static String billsSql = 'CREATE TABLE $_tableName ('
      '$_name TEXT,'
      '$_value REAL,'
      '$_description TEXT,'
      '$_dueDate INTEGER,'
      '$_paid INTEGER'
      ')';

  Database database;

  BillsDAO({required this.database});

  Future<int> insertBill(Bill bill) async {
    int codeReturn = await database.insert(_tableName, bill.toJsonDB());
    return codeReturn;
  }

  Future<List<Bill>> getAllBills() async {
    List<Map<String, dynamic>> billsFromDB = await database.query(_tableName);

    List<Bill> billsToReturn =
        billsFromDB.map((billJson) => Bill.fromJson(billJson)).toList();

    return billsToReturn;
  }
}
