import 'package:bloc_test/bloc_test.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_cubit.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/bills_list/bills_list_bloc.dart';

import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/bills_dao_mock.dart';

void main() {
  group("Group of test for Add Form Dialog Cubit", () {
    final BillsDAOMock billsDAOMock = BillsDAOMock();
    late AddFormDialogCubit addFormDialogCubit;
    final BillsListCubit billsListCubitMock =
        BillsListCubit(billsDAO: billsDAOMock);

    setUp(() {
      addFormDialogCubit =
          AddFormDialogCubit(billsListCubit: billsListCubitMock);

      when(
        () => billsDAOMock.insertBill(IsolatedBill.empty()),
      ).thenAnswer((invocation) async => 1);
    });

    test("should initiate the Dialog in LoadedAddFormDialogState", () {
      expect(addFormDialogCubit.state, isA<LoadedAddFormDialogState>());
    });

    blocTest(
      "should emit the SentState() when confirm the bill",
      build: () => addFormDialogCubit,
      act: (bloc) => bloc.confirmAddBill(IsolatedBill.empty()),
      expect: () => [SentState()],
    );

    tearDown(() {
      addFormDialogCubit.close();
    });
  });
}
