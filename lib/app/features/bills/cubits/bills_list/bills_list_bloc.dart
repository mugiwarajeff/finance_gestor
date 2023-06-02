import 'package:finance_gestor/app/features/bills/cubits/bills_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bill.dart';

class BillsListCubit extends Cubit<BillsListState> {
  final List<Bill> _bills = [
    Bill(
        name: "Riachuello",
        value: 143.50,
        description: "Compra de sapato",
        dueDate: DateTime(2023, 5, 22),
        paid: false),
  ];

  BillsListCubit() : super(BillsListInitial(bills: []));

  void changeToLoaded() {
    emit(BillsListLoaded(bills: _bills));
  }

  void addNewBill(Bill bill) {
    _bills.add(bill);
    emit(BillsListLoaded(bills: _bills));
  }
}
