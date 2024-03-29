import 'package:finance_gestor/app/features/bills/bills_view/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/enuns/bill_state.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bill_card/card_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  late LoadedCardState paidLoadedCardState;
  late LoadedCardState openLoadedCardState;
  late LoadedCardState overdueLoadedCardState;

  setUp(() {
    paidLoadedCardState = LoadedCardState(
        principalColor: Colors.green,
        secondaryColor: const Color.fromARGB(30, 105, 240, 175),
        billStates: BillStates.paid);
    openLoadedCardState = LoadedCardState(
        principalColor: Colors.blue,
        secondaryColor: const Color.fromARGB(30, 68, 137, 255),
        billStates: BillStates.open);
    overdueLoadedCardState = LoadedCardState(
        principalColor: Colors.orange,
        secondaryColor: const Color.fromARGB(30, 255, 172, 64),
        billStates: BillStates.overdue);
  });

  testWidgets("Should show a cardTrailing with 70 of width and 40 of height ",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: Scaffold(
        body: CardTrailin(
          billStates: paidLoadedCardState.billStates,
          principalColor: paidLoadedCardState.principalColor,
          secondaryColor: paidLoadedCardState.secondaryColor,
        ),
      ),
    ));

    const double expectedHeight = 40;
    const double expectedWidth = 70;
    const double expectedRadius = 25;
    const double borderSize = 1;

    Finder heightCardFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        BoxConstraints widgetBoxConstraints = widget.constraints!;

        if (widgetBoxConstraints.maxHeight == widgetBoxConstraints.minHeight &&
            widgetBoxConstraints.maxHeight == expectedHeight) {
          return true;
        }
      }

      return false;
    });
    expect(heightCardFinder, findsOneWidget);

    Finder widthCardFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        BoxConstraints widgetBoxConstraints = widget.constraints!;

        if (widgetBoxConstraints.maxWidth == widgetBoxConstraints.minWidth &&
            widgetBoxConstraints.maxWidth == expectedWidth) {
          return true;
        }
      }

      return false;
    });
    expect(widthCardFinder, findsOneWidget);

    Finder radiusCardFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).borderRadius ==
            BorderRadius.circular(expectedRadius)) {
          return true;
        }
      }

      return false;
    });
    expect(radiusCardFinder, findsOneWidget);

    Finder borderContainerFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).border!.bottom.width ==
            borderSize) {
          return true;
        }
      }
      return false;
    });
    expect(borderContainerFinder, findsOneWidget);
  });

  testWidgets(
      "should show a cardTrailing with paid configuration for text and collor",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: Scaffold(
        body: CardTrailin(
          billStates: paidLoadedCardState.billStates,
          principalColor: paidLoadedCardState.principalColor,
          secondaryColor: paidLoadedCardState.secondaryColor,
        ),
      ),
    ));

    Finder colorContainerFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).color ==
            paidLoadedCardState.secondaryColor) {
          return true;
        }
      }

      return false;
    });
    expect(colorContainerFinder, findsOneWidget);

    Finder borderColorFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).border!.bottom.color ==
            paidLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(borderColorFinder, findsOneWidget);

    Finder cardTrailingTextFinder = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        if (widget.data == "Paid" &&
            widget.style!.color == paidLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(cardTrailingTextFinder, findsOneWidget);
  });

  testWidgets(
      "should show a cardTrailing with open configuration for text and collor",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: Scaffold(
        body: CardTrailin(
          billStates: openLoadedCardState.billStates,
          principalColor: openLoadedCardState.principalColor,
          secondaryColor: openLoadedCardState.secondaryColor,
        ),
      ),
    ));

    Finder colorContainerFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).color ==
            openLoadedCardState.secondaryColor) {
          return true;
        }
      }

      return false;
    });
    expect(colorContainerFinder, findsOneWidget);

    Finder borderColorFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).border!.bottom.color ==
            openLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(borderColorFinder, findsOneWidget);

    Finder cardTrailingTextFinder = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        if (widget.data == "Open" &&
            widget.style!.color == openLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(cardTrailingTextFinder, findsOneWidget);
  });

  testWidgets(
      "should show a cardTrailing with overdue configuration for text and collor",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: Scaffold(
        body: CardTrailin(
          billStates: overdueLoadedCardState.billStates,
          principalColor: overdueLoadedCardState.principalColor,
          secondaryColor: overdueLoadedCardState.secondaryColor,
        ),
      ),
    ));

    Finder colorContainerFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).color ==
            overdueLoadedCardState.secondaryColor) {
          return true;
        }
      }

      return false;
    });
    expect(colorContainerFinder, findsOneWidget);

    Finder borderColorFinder = find.byWidgetPredicate((widget) {
      if (widget is Container) {
        if ((widget.decoration as BoxDecoration).border!.bottom.color ==
            overdueLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(borderColorFinder, findsOneWidget);

    Finder cardTrailingTextFinder = find.byWidgetPredicate((widget) {
      if (widget is Text) {
        if (widget.data == "Overdue" &&
            widget.style!.color == overdueLoadedCardState.principalColor) {
          return true;
        }
      }
      return false;
    });
    expect(cardTrailingTextFinder, findsOneWidget);
  });
}
