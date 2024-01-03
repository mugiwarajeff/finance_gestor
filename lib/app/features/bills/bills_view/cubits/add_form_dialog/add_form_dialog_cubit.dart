import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/enuns/bill_type.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';

import 'package:finance_gestor/app/features/bills/bills_view/models/recorrency_bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bills_list/bills_list_bloc.dart';

class AddFormDialogCubit extends Cubit<AddFormDialogState> {
  final BillsListCubit billsListCubit;
  Set<BillType> selectedBillType = {BillType.isolated};
  Bill newBill = RecorrencyBill.empty();

  AddFormDialogCubit({required this.billsListCubit})
      : super(InitialAddFormDialogState()) {
    emit(LoadingAddFormDialogState());
    _loadForm();
  }

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _loadForm() {
    emit(
        LoadedAddFormDialogState(billType: selectedBillType, newBill: newBill));
  }

  void confirmAddBill() {
    if (selectedBillType.first == BillType.isolated) {
      newBill = IsolatedBill.fromRecorrencyBill(newBill as RecorrencyBill);
    }

    billsListCubit.addNewBill(newBill);
    emit(SentState());
  }

  void onChangeBillType(Set<BillType> newBillType) {
    emit(LoadingAddFormDialogState());
    selectedBillType = newBillType;
    emit(
        LoadedAddFormDialogState(billType: selectedBillType, newBill: newBill));
  }
}
