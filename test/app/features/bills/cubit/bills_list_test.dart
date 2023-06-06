import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BillsListCubit billsListCubit = BillsListCubit();

  test(
      "should present init state with loading state and loaded state after 2 seconds",
      () async {
    expect(billsListCubit.state, isA<BillsListLoading>());
    await Future.delayed(const Duration(seconds: 2));
    expect(billsListCubit.state, isA<BillsListLoaded>());
  });

  test("should add a new bill", () {
    final Bill newBill = Bill(
        dueDate: DateTime.now(),
        name: "teste",
        paid: false,
        value: 10,
        description: "");

    billsListCubit.addNewBill(newBill);

    //expect(billsListCubit.stream,emitsInOrder([isA<BillsListLoading>(), isA<BillsListLoaded>()]));
  });
}
