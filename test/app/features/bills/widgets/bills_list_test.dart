import 'package:finance_gestor/app/features/bills/bills_view/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_category.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart'
    as my;
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/name.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/value.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bill_card.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bills_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../mocks/bills_dao_mock.dart';

void main() {
  final BillsDAOMock billsDAOMock = BillsDAOMock();
  late BillsListCubit billListCubit;
  late Bill bill;
  setUp(() {
    billListCubit = BillsListCubit(billsDAO: billsDAOMock);

    bill = IsolatedBill(
        name: Name(value: "teste"),
        dueDate: DueDate(value: DateTime.now()),
        paid: false,
        value: Value(value: 20.3),
        category: BillCategory(id: 0, name: ""),
        description: my.Description(value: "teste"));

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
      await tester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        home: Scaffold(body: BillsList(billsListCubit: billListCubit)),
      ));

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
