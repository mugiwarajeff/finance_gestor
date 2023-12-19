import 'package:bloc_test/bloc_test.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart'
    as my;
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';

import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/name.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/value.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/bills_dao_mock.dart';

void main() {
  final BillsDAOMock billsDAOMock = BillsDAOMock();
  late BillsListCubit billsListCubit;
  late Bill bill;
  group("Group of Bill List BLoC  test", () {
    setUp(() {
      billsListCubit = BillsListCubit(billsDAO: billsDAOMock);
      bill = Bill(
          name: Name(value: "teste"),
          value: Value(value: 10),
          dueDate: DueDate(value: DateTime.now()),
          description: my.Description(value: "teste teste"),
          paid: false);

      when(() => billsDAOMock.getAllBills())
          .thenAnswer((invocation) async => [Bill.empty()]);

      when(
        () => billsDAOMock.insertBill(bill),
      ).thenAnswer((invocation) async => 1);
    });

    test("should initiate the cubit with BillListLoading", () {
      expect(billsListCubit.state, isA<BillsListLoading>());
    });

    blocTest(
      "should wait the loading and emit BillListLoading:[]",
      build: () => billsListCubit,
      wait: const Duration(seconds: 3),
      expect: () => [
        BillsListLoaded(bills: [Bill.empty()])
      ],
    );

    blocTest("should add a new bill and return BillsListLoaded:[newBill]",
        build: () => billsListCubit,
        // ignore: unnecessary_cast
        seed: () => BillsListLoaded(bills: const []) as BillsListState,
        act: (bloc) => bloc.addNewBill(bill),
        expect: () => [
              BillsListLoading(),
              BillsListLoaded(bills: [bill]),
            ]);

    blocTest(
      //tem erro
      "should add a second bill and return BillsListLoaded:[newBill, newBill] ",
      setUp: () => billsListCubit.addNewBill(bill),
      build: () => billsListCubit,
      act: (bloc) => bloc.addNewBill(bill),
      expect: () => [
        BillsListLoading(),
        BillsListLoaded(bills: [bill, bill])
      ],
    );
  });
}
