import 'package:bloc_test/bloc_test.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_cubit.dart';
import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/form_unvalidated_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/bills_list_cubit_mock.dart';

void main() {
  group("Group of test for Add Form Dialog Cubit", () {
    late AddFormDialogCubit addFormDialogCubit;
    final BillsListCubitMock billsListCubitMock = BillsListCubitMock();
    // ignore: unused_local_variable
    final UnvalidatedAddFormDialogState unvalidatedAddFormDialogStateFull =
        UnvalidatedAddFormDialogState(unvalidatedTypes: const [
      UnvalidatedTypes.nameBlank,
      UnvalidatedTypes.valueBlank,
      UnvalidatedTypes.dateBlank
    ]);

    final UnvalidatedAddFormDialogState
        unvalidatedAddFormDialogStateWithoutName =
        UnvalidatedAddFormDialogState(
            unvalidatedTypes: const [UnvalidatedTypes.nameBlank]);

    final UnvalidatedAddFormDialogState
        unvalidatedAddFormDialogStateWithoutNameAndDate =
        UnvalidatedAddFormDialogState(unvalidatedTypes: const [
      UnvalidatedTypes.nameBlank,
      UnvalidatedTypes.dateBlank
    ]);

    setUp(() {
      addFormDialogCubit =
          AddFormDialogCubit(billsListCubit: billsListCubitMock);
    });

    test("should initiate the Dialog in LoadedAddFormDialogState", () {
      expect(addFormDialogCubit.state, isA<LoadedAddFormDialogState>());
    });

    blocTest(
      "should emit the SentState() when confirm the bill",
      build: () => addFormDialogCubit,
      setUp: () {
        addFormDialogCubit.nameInputController.text = "Renner";
        addFormDialogCubit.valueInputController.text = '24.12';
        addFormDialogCubit.selectedDueDate = DateTime.now();
        addFormDialogCubit.descriptionInputController.text = "lasdasdak";
      },
      act: (bloc) => bloc.confirmAddBill(),
      expect: () => [SentState()],
    );

    blocTest(
      "should emit the UnvalidatedAddFormDialogState(Value is Blank, Date is Blank) when confirm the bill",
      build: () => addFormDialogCubit,
      setUp: () {
        addFormDialogCubit.valueInputController.text = '24.12';
        addFormDialogCubit.selectedDueDate = DateTime.now();
        addFormDialogCubit.descriptionInputController.text = "lasdasdak";
      },
      act: (bloc) => bloc.confirmAddBill(),
      expect: () => [unvalidatedAddFormDialogStateWithoutName],
    );

    blocTest(
      "should emit the UnvalidatedAddFormDialogState(Value is Blank) when confirm the bill",
      setUp: () {
        addFormDialogCubit.valueInputController.text = '24.12';
        addFormDialogCubit.descriptionInputController.text = "lasdasdak";
      },
      build: () => addFormDialogCubit,
      act: (bloc) => bloc.confirmAddBill(),
      expect: () => [unvalidatedAddFormDialogStateWithoutNameAndDate],
    );

    tearDown(() {
      addFormDialogCubit.close();
    });
  });
}
