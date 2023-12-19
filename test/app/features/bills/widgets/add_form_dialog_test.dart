import 'package:finance_gestor/app/features/bills/bills_view/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/add_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../mocks/bills_dao_mock.dart';

void main() {
  late BillsListCubit billsListCubit;

  setUp(() {
    billsListCubit = BillsListCubit(billsDAO: BillsDAOMock());
  });

  testWidgets("Should present formulary with principal fields",
      (WidgetTester tester) async {
    const String expectedPrinipalTitle = "Adding Bill";
    const String expectedNameLabel = "* Name";
    const String expectedNameHint = "Insert a name for Bill";
    const IconData expectNameIcon = Icons.abc;
    const TextInputType expectedNameInputType = TextInputType.name;

    const String expectedValueLabel = "* Value";
    const String expectedValueHint = "Insert a value for Bill";
    const IconData expectValueIcon = Icons.monetization_on_outlined;
    const TextInputType expectedValueInputType = TextInputType.number;

    const String expectedDuedateLabel = "* Due Date";
    const String expectedDuedateHint = "Select the Due Date of Bill";
    const IconData expectDuedateIcon = Icons.calendar_month;
    const TextInputType expectedDuedateInputType = TextInputType.datetime;

    const String expectedDescriptionLabel = "* Description";
    const String expectedDescriptionHint = "Insert a description for Bill";
    const IconData expectDescriptionIcon = Icons.abc;
    const TextInputType expectedDescriptionInputType = TextInputType.text;

    const String confirmText = "Confirm";
    const String cancelText = "Cancel";

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: AddFormDialog(billsListCubit: billsListCubit)),
    ));

    Finder titleFinder = find.widgetWithText(Column, expectedPrinipalTitle);
    expect(titleFinder, findsOneWidget);

    Finder nameInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedNameLabel &&
            widget.hintText == expectedNameHint &&
            widget.icon == expectNameIcon &&
            widget.textInputType == expectedNameInputType) {
          return true;
        }
      }

      return false;
    });
    expect(nameInputFinder, findsOneWidget);
//
    Finder valueInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedValueLabel &&
            widget.hintText == expectedValueHint &&
            widget.icon == expectValueIcon &&
            widget.textInputType == expectedValueInputType) {
          return true;
        }
      }

      return false;
    });
    expect(valueInputFinder, findsOneWidget);
//
    Finder descriptionInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedDescriptionLabel &&
            widget.hintText == expectedDescriptionHint &&
            widget.icon == expectDescriptionIcon &&
            widget.textInputType == expectedDescriptionInputType) {
          return true;
        }
      }

      return false;
    });
    expect(descriptionInputFinder, findsOneWidget);
//
    Finder dateTimeInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedDuedateLabel &&
            widget.hintText == expectedDuedateHint &&
            widget.icon == expectDuedateIcon &&
            widget.textInputType == expectedDuedateInputType) {
          return true;
        }
      }

      return false;
    });
    expect(dateTimeInputFinder, findsOneWidget);

    Finder confirmTextButtonFinder =
        find.widgetWithText(TextButton, confirmText);
    expect(confirmTextButtonFinder, findsOneWidget);

    Finder cancelTextButtonFinder = find.widgetWithText(TextButton, cancelText);
    expect(cancelTextButtonFinder, findsOneWidget);
  });

  testWidgets("Should present error text when the value is blank",
      (WidgetTester tester) async {
    const String expectedNameLabel = "* Name";
    const String expectedNameHint = "Insert a name for Bill";
    const IconData expectNameIcon = Icons.abc;
    const TextInputType expectedNameInputType = TextInputType.name;

    const String expectedValueLabel = "* Value";
    const String expectedValueHint = "Insert a value for Bill";
    const IconData expectValueIcon = Icons.monetization_on_outlined;
    const TextInputType expectedValueInputType = TextInputType.number;

    const String confirmText = "Confirm";
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: AddFormDialog(billsListCubit: billsListCubit)),
    ));

    Finder confirmButton = find.widgetWithText(TextButton, confirmText);
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();

    Finder nameInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedNameLabel &&
            widget.hintText == expectedNameHint &&
            widget.icon == expectNameIcon &&
            widget.textInputType == expectedNameInputType) {
          return true;
        }
      }
      return false;
    });
    expect(nameInputFinder, findsOneWidget);

    Finder valueInputFinder = find.byWidgetPredicate((widget) {
      if (widget is AddFormInput) {
        if (widget.labelText == expectedValueLabel &&
            widget.hintText == expectedValueHint &&
            widget.icon == expectValueIcon &&
            widget.textInputType == expectedValueInputType) {
          return true;
        }
      }

      return false;
    });
    expect(valueInputFinder, findsOneWidget);
  });
}
