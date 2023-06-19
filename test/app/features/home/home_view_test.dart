import 'package:finance_gestor/app/features/bills/bills_view.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/dashboards/dashboards_view.dart';
import 'package:finance_gestor/app/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  testWidgets("Should present the home page with Dashboard page configuration",
      (WidgetTester tester) async {
    const String expectedAppbarTitle = "Dashboard";
    await tester.pumpWidget(MaterialApp(
      home: HomeView(),
    ));

    Finder appBarFinder = find.widgetWithText(AppBar, expectedAppbarTitle);
    expect(appBarFinder, findsOneWidget);

    Finder bodyFinder = find.byType(DashboardsView);
    expect(bodyFinder, findsOneWidget);

    Finder bottomNavigationBarFinder = find.byWidgetPredicate((widget) {
      if (widget is BottomNavigationBar) {
        if (widget.items.length == 2) {
          return true;
        }
      }
      return false;
    });
    expect(bottomNavigationBarFinder, findsOneWidget);
  });

  testWidgets(
      "Should present the home page with BillList Configuration when the item is selected in home bottom menu",
      (WidgetTester tester) async {
    const String expectedAppbarTitle = "Bills";
    await tester.pumpWidget(BlocProvider(
      create: (context) => BillsListCubit(),
      child: MaterialApp(
        home: HomeView(),
      ),
    ));

    Finder billListItemFinder = find.byIcon(Icons.list);

    await tester.tap(billListItemFinder);
    await tester.pumpAndSettle();

    Finder appBarTitle = find.widgetWithText(AppBar, expectedAppbarTitle);
    expect(appBarTitle, findsOneWidget);

    Finder bodyFinder = find.byType(BillsView);
    expect(bodyFinder, findsOneWidget);
  });
}
