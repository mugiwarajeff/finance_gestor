import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/bill_category.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart'
    as my;
import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/name.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/value.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bill_card.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bill_card/card_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Bill bill = IsolatedBill(
      name: Name(value: "teste"),
      value: Value(value: 23),
      dueDate: DueDate(value: DateTime.now()),
      category: BillCategory(value: ""),
      description: my.Description(value: "teste teste"),
      paid: false);

  setUp(() {});

  testWidgets("Should have a ListTile with the text of value and icon",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: BillCard(
          bill: bill,
          dismissibleKey: Key(bill.name.value),
          onDelete: () {},
        ),
      ),
    ));

    Finder listTileFinder = find.byType(ListTile);
    expect(listTileFinder, findsOneWidget);

    Finder valueTextFinder = find.widgetWithText(ListTile, "\$23.00");
    expect(valueTextFinder, findsOneWidget);

    Finder iconFinder = find.byIcon(Icons.monetization_on);
    expect(iconFinder, findsOneWidget);

    Finder iconSizeFinder =
        find.byWidgetPredicate((widget) => widget is Icon && widget.size == 30);
    expect(iconSizeFinder, findsOneWidget);
  });

  testWidgets("Should have a CardTrailing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: BillCard(
          bill: bill,
          dismissibleKey: Key(bill.name.value),
          onDelete: () {},
        ),
      ),
    ));

    Finder cardTrailingFinder = find.byType(CardTrailin);
    expect(cardTrailingFinder, findsOneWidget);
  });
}
