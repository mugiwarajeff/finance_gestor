import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bills_list/bills_list_bloc.dart';

class AddFormDialogCubit extends Cubit<AddFormDialogState> {
  final BillsListCubit billsListCubit;

  AddFormDialogCubit({required this.billsListCubit})
      : super(InitialAddFormDialogState()) {
    emit(LoadingAddFormDialogState());
    _loadForm();
  }

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _loadForm() {
    emit(LoadedAddFormDialogState());
  }

  void confirmAddBill(Bill newBill) {
    billsListCubit.addNewBill(newBill);
    emit(SentState());
  }
}
