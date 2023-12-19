import 'package:finance_gestor/app/features/bills/bills_view/cubits/bill_card/card_cubit.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart'
    as my;
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/name.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test of Card Cubit class", () {
    late CardCubit cardCubit;
    late Bill paidBill;
    late Bill overdueBill;
    late Bill openBill;

    setUp(() {
      paidBill = Bill(
          name: Name(value: "paid"),
          value: Value(value: 10),
          dueDate: DueDate(value: DateTime.now()),
          paid: true,
          description: my.Description(value: "teste teste"));
      overdueBill = Bill(
          name: Name(value: "overdue"),
          value: Value(value: 10),
          dueDate: DueDate(value: DateTime(1900)),
          description: my.Description(value: "teste teste"),
          paid: false);
      openBill = Bill(
          name: Name(value: "open"),
          value: Value(value: 10),
          dueDate: DueDate(value: DateTime(3000)),
          description: my.Description(value: "teste teste"),
          paid: false);
    });

    test("should is in loaded state after instantiation", () {
      CardCubit cardCubit = CardCubit(paidBill);
      expect(cardCubit.state, equals(cardCubit.paidCardState));
    });

    test("should return a loadedState with paid configuration ", () {
      cardCubit = CardCubit(paidBill);

      expect(cardCubit.state, equals(cardCubit.paidCardState));
    });

    test("should return a loadedState with overdue configuration ", () {
      cardCubit = CardCubit(overdueBill);

      expect(cardCubit.state, equals(cardCubit.overdueCardState));
    });

    test("should return a loadedState with open configuration ", () {
      cardCubit = CardCubit(openBill);

      expect(cardCubit.state, equals(cardCubit.openCardState));
    });
  });
}
