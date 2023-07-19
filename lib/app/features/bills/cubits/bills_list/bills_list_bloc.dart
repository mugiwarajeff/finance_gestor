import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/error_types.dart';
import 'package:finance_gestor/database/daos/bills_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/bill.dart';
import '../../widgets/add_form_dialog.dart';

class BillsListCubit extends Cubit<BillsListState> {
  final List<Bill> _bills = [];
  final BillsDAO billsDAO;

  BillsListCubit({required this.billsDAO}) : super(BillsListInitial()) {
    emit(BillsListLoading());
    loadBills();
  }

  Future<void> loadBills() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _bills.clear();
      _bills.addAll(await billsDAO.getAllBills());
      emit(BillsListLoaded(bills: _bills));

      _verifyEmptyList();
    } catch (e) {
      emit(BillsListError(errorType: BillsErrorType.obtain));
    }
  }

  void addNewBill(Bill bill) async {
    emit(BillsListLoading());
    try {
      await billsDAO.insertBill(bill);
      _bills.add(bill);
      emit(BillsListLoaded(bills: _bills));
    } on DatabaseException {
      emit(BillsListError(errorType: BillsErrorType.insert));
      emit(BillsListLoaded(bills: _bills));
    }
  }

  void deleteBill(Bill bill) async {
    emit(BillsListLoading());

    try {
      await billsDAO.deleteBill(bill);
      _bills.remove(bill);
      emit(BillsListLoaded(bills: _bills));
      _verifyEmptyList();
    } on DatabaseException {
      emit(BillsListError(errorType: BillsErrorType.delete));
    }
  }

  void _verifyEmptyList() {
    if (_bills.isEmpty) emit(BillsListInitial());
  }

  void showAddBillDialog(BuildContext context, BillsListCubit billsListCubit) {
    showDialog(
      context: context,
      builder: (context) => AddFormDialog(billsListCubit: billsListCubit),
    );
  }
}
