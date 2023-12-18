import 'package:sqflite/sqflite.dart';

import '../../../features/bills/bills_view/models/bill.dart';

class BillsDAO {
  static const String _tableName = "bills";
  static const String _name = "name";
  static const String _value = "value";
  static const String _description = "description";
  static const String _dueDate = "dueDate";
  static const String _paid = "paid";

  static String billsSql = 'CREATE TABLE $_tableName ('
      '$_name TEXT PRIMARY KEY,'
      '$_value REAL,'
      '$_description TEXT,'
      '$_dueDate INTEGER,'
      '$_paid INTEGER'
      ')';

  late Database database;

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

  Future<Bill?> deleteBill(Bill bill) async {
    int quantDelete = await database.delete(_tableName,
        where: "$_name = '${bill.name.value}'");

    if (quantDelete == 1) {
      return bill;
    }

    return null;
  }

  Future<Bill?> updateBill(Bill bill) async {
    int quantUpdate = await database.update(_tableName, bill.toJsonDB(),
        where: "$_name = '${bill.name.value}' ");

    if (quantUpdate == 1) {
      return bill;
    }

    return null;
  }
}
