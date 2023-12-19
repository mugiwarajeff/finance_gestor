import 'package:finance_gestor/app/features/bills/bills_view/models/bill_category.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart'
    as my;
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/name.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/value.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:finance_gestor/app/shared/database/daos/bills_dao.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import '../../mocks/database_mock.dart';

void main() {
  final Bill billTest = IsolatedBill(
      name: Name(value: "Riachuello"),
      paid: false,
      value: Value(value: 32.12),
      description: my.Description(value: "testes"),
      category: BillCategory(id: 0, name: "name"),
      dueDate: DueDate(value: DateTime(2023, 7, 5)));
  final DatabaseMock databaseMock = DatabaseMock();
  late BillsDAO billsDAO;
  setUp(() {
    billsDAO = BillsDAO(database: databaseMock);

    when(
      () => databaseMock.insert(any(), any()),
    ).thenAnswer((realInvocation) async => 1);

    when(
      () => databaseMock.delete("bills",
          where: "name = '${billTest.name.value}'"),
    ).thenAnswer((realInvocation) async => 1);

    when(() => databaseMock.query(any()))
        .thenAnswer((realInvocation) async => [billTest.toJsonDB()]);
  });

  test("Should return 1 when insert a new value in table", () async {
    int expectedValue = await billsDAO.insertBill(billTest);
    expect(expectedValue, equals(1));
  });

  test("Should return a list of Bills when get all bills", () async {
    List<Bill> bills = await billsDAO.getAllBills();

    expect(bills, isA<List<Bill>>());
    expect(bills.first, equals(billTest));
  });

  test("Should return the bill when delete a Bill", () async {
    Bill? billDeleted = await billsDAO.deleteBill(billTest);
    expect(billDeleted, equals(billTest));
  });

  tearDown(() {});
}
