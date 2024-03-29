import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/recorrency_bill.dart';
import 'package:sqflite/sqflite.dart';
import '../../../features/bills/bills_view/models/interfaces/bill.dart';

class BillsDAO {
  static const String _tableName = "bills";
  static const String _name = "name";
  static const String _value = "value";
  static const String _description = "description";
  static const String _dueDate = "dueDate";
  static const String _paid = "paid";
  static const String _category = "category";
  static const String _limitRecorrency = "limit_recorrency";

  static String billsSql = 'CREATE TABLE $_tableName ('
      '$_name TEXT PRIMARY KEY,'
      '$_value REAL,'
      '$_description TEXT,'
      '$_dueDate INTEGER,'
      '$_paid INTEGER,'
      '$_category TEXT,'
      "$_limitRecorrency INTEGER"
      ')';

  late Database database;

  BillsDAO({required this.database});

  Future<int> insertBill(Bill bill) async {
    int codeReturn = await database.insert(_tableName, bill.toJsonDB());
    return codeReturn;
  }

  Future<List<Bill>> getAllBills() async {
    List<Map<String, dynamic>> billsFromDB = await database.query(_tableName);

    List<Bill> billsToReturn = billsFromDB.map((billJson) {
      if (billJson[_limitRecorrency] == null) {
        return IsolatedBill.fromJson(billJson);
      } else {
        return RecorrencyBill.fromJson(billJson);
      }
    }).toList();

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
