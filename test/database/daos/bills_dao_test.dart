import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/database/daos/bills_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/database_mock.dart';

void main() {
  final Bill billTest = Bill(
      name: "Riachuello",
      paid: false,
      value: 32.12,
      description: "teste",
      dueDate: DateTime(2023, 7, 5));
  final DatabaseMock databaseMock = DatabaseMock();
  late BillsDAO billsDAO;
  setUp(() {
    billsDAO = BillsDAO(database: databaseMock);

    when(
      () => databaseMock.insert(any(), any()),
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

  tearDown(() {});
}
