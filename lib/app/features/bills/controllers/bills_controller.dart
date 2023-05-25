import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog.dart';
import 'package:flutter/material.dart';

class BillsController extends ChangeNotifier {
  final List<Bill> _bills = [
    Bill(
        name: "Riachuello",
        value: 143.50,
        description: "Compra de sapato",
        dueDate: DateTime(2023, 5, 22),
        paid: false),
  ];

  List<Bill> get bills => _bills;

  void addBill(Bill bill) {
    _bills.add(bill);
    notifyListeners();
  }

  void showAddBillDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddFormDialog(),
    );
  }
}
