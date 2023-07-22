import 'package:finance_gestor/app/features/bills/bills_view/models/bill.dart';
import 'package:flutter/material.dart';

abstract class BillEditState {}

class InitialBillEditState extends BillEditState {}

class LoadedBillEditState extends BillEditState {
  late final TextEditingController nameController;
  late final TextEditingController valueController;
  late final TextEditingController dateController;
  late final TextEditingController descriptionController;
  final Bill bill;

  LoadedBillEditState({required this.bill}) {
    nameController = TextEditingController(text: bill.name);
    valueController = TextEditingController(text: bill.value.toString());
    dateController = TextEditingController(text: bill.dueDate.toString());
    descriptionController = TextEditingController(text: bill.description);
  }
}

class ErrorBillEditState extends BillEditState {}
