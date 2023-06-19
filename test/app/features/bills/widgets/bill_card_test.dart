import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/widgets/bill_card.dart';
import 'package:finance_gestor/app/features/bills/widgets/bill_card/card_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Bill bill =
      Bill(name: "teste", value: 23, dueDate: DateTime.now(), paid: false);

  setUp(() {});

  testWidgets("Should have a ListTile with the text of value and icon",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BillCard(bill: bill),
    ));

    Finder listTileFinder = find.byType(ListTile);
    expect(listTileFinder, findsOneWidget);

    Finder valueTextFinder = find.widgetWithText(ListTile, "R\$ 23,00");
    expect(valueTextFinder, findsOneWidget);

    Finder iconFinder = find.byIcon(Icons.monetization_on);
    expect(iconFinder, findsOneWidget);

    Finder iconSizeFinder =
        find.byWidgetPredicate((widget) => widget is Icon && widget.size == 30);
    expect(iconSizeFinder, findsOneWidget);
  });

  testWidgets("Should have a CardTrailing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BillCard(bill: bill),
    ));

    Finder cardTrailingFinder = find.byType(CardTrailin);
    expect(cardTrailingFinder, findsOneWidget);
  });
}
