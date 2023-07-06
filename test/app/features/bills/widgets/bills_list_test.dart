import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/widgets/bill_card.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/bills_dao_mock.dart';

void main() {
  final BillsDAOMock billsDAOMock = BillsDAOMock();
  late BillsListCubit billListCubit;
  late Bill bill;
  setUp(() {
    billListCubit = BillsListCubit(billsDAO: billsDAOMock);

    bill = Bill(
        name: "teste",
        dueDate: DateTime.now(),
        paid: false,
        value: 20.3,
        description: "teste");

    when(
      () => billsDAOMock.getAllBills(),
    ).thenAnswer((invocation) async => [bill]);

    when(
      () => billsDAOMock.insertBill(bill),
    ).thenAnswer((invocation) async => 1);
  });
  testWidgets("Should show loading progress indicator when enter in page",
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: BillsList(billsListCubit: billListCubit)));

    Finder progressIndicatorFinder = find.byType(CircularProgressIndicator);

    expect(progressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
    "Should show a ListView and a BillCard after adding a new bill",
    (WidgetTester tester) async {
      billListCubit.addNewBill(bill);
      await tester.pumpWidget(
          MaterialApp(home: BillsList(billsListCubit: billListCubit)));

      Finder listViewFinder = find.byType(ListView);
      await tester.pump();
      expect(listViewFinder, findsOneWidget);
      Finder billCardFinder = find.byType(BillCard);
      expect(billCardFinder, findsOneWidget);
    },
  );

  testWidgets("Should show empty Container when billListCubit is empty",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BillsList(billsListCubit: billListCubit),
    ));

    await tester.pump(const Duration(seconds: 3));

    Finder containerFind = find.byType(Container);
    expect(containerFind, findsOneWidget);
  });
}
