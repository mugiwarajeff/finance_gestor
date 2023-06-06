import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bill.dart';
import '../../widgets/add_form_dialog.dart';

class BillsListCubit extends Cubit<BillsListState> {
  final List<Bill> _bills = [
    Bill(
        name: "Riachuello",
        value: 143.50,
        description: "Compra de sapato",
        dueDate: DateTime(2023, 5, 22),
        paid: false),
  ];

  BillsListCubit() : super(BillsListInitial()) {
    _loadBills();
  }

  Future<void> _loadBills() async {
    emit(BillsListLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(BillsListLoaded(bills: _bills));
  }

  void addNewBill(Bill bill) async {
    emit(BillsListLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    _bills.add(bill);
    emit(BillsListLoaded(bills: _bills));
  }

  void showAddBillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddFormDialog(),
    );
  }
}
