import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/database/daos/bills_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bill.dart';
import '../../widgets/add_form_dialog.dart';

class BillsListCubit extends Cubit<BillsListState> {
  final List<Bill> _bills = [];
  final BillsDAO billsDAO;

  BillsListCubit({required this.billsDAO}) : super(BillsListInitial()) {
    emit(BillsListLoading());
    _loadBills();
  }

  Future<void> _loadBills() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      _bills.addAll(await billsDAO.getAllBills());
      emit(BillsListLoaded(bills: _bills));
    } catch (e) {
      emit(BillsListError(error: e.toString()));
    }
  }

  void addNewBill(Bill bill) async {
    emit(BillsListLoading());
    try {
      _bills.add(bill);
      await billsDAO.insertBill(bill);
      emit(BillsListLoaded(bills: _bills));
    } catch (e) {
      emit(BillsListError(error: e.toString()));
    }
  }

  void showAddBillDialog(BuildContext context, BillsListCubit billsListCubit) {
    showDialog(
      context: context,
      builder: (context) => AddFormDialog(billsListCubit: billsListCubit),
    );
  }
}
