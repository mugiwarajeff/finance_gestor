import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bill.dart';
import '../../widgets/add_form_dialog.dart';

class BillsListCubit extends Cubit<BillsListState> {
  final List<Bill> _bills = [];

  BillsListCubit() : super(BillsListInitial()) {
    emit(BillsListLoading());
    _loadBills();
  }

  Future<void> _loadBills() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(BillsListLoaded(bills: _bills));
    } catch (e) {
      emit(BillsListError(error: e.toString()));
    }
  }

  Future<void> addNewBill(Bill bill) async {
    emit(BillsListLoading());
    //await Future.delayed(const Duration(milliseconds: 1000));
    try {
      _bills.add(bill);
      emit(BillsListLoaded(bills: _bills));
    } catch (e) {
      emit(BillsListError(error: e.toString()));
    }
  }

  void showAddBillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddFormDialog(),
    );
  }
}
