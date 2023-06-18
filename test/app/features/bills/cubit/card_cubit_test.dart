import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_cubit.dart';
import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test of Card Cubit class", () {
    late CardCubit cardCubit;
    late Bill paidBill;
    late Bill overdueBill;
    late Bill openBill;

    late PaidLoadedCardState paidState;
    late OverdueLoadedCardState overdueState;
    late OpenLoadedCardState openState;

    setUp(() {
      paidBill =
          Bill(name: "paid", value: 10, dueDate: DateTime.now(), paid: true);
      overdueBill = Bill(
          name: "overdue", value: 10, dueDate: DateTime(1900), paid: false);
      openBill =
          Bill(name: "open", value: 10, dueDate: DateTime(3000), paid: false);

      paidState = PaidLoadedCardState();
      overdueState = OverdueLoadedCardState();
      openState = OpenLoadedCardState();
    });

    test("should is in loaded state after instantiation", () {
      CardCubit cardCubit = CardCubit(paidBill);
      expect(cardCubit.state, equals(paidState));
    });

    test("should return a loadedState with paid configuration ", () {
      cardCubit = CardCubit(paidBill);

      expect(cardCubit.state, equals(paidState));
    });

    test("should return a loadedState with overdue configuration ", () {
      cardCubit = CardCubit(overdueBill);

      expect(cardCubit.state, equals(overdueState));
    });

    test("should return a loadedState with open configuration ", () {
      cardCubit = CardCubit(openBill);

      expect(cardCubit.state, equals(openState));
    });
  });
}
