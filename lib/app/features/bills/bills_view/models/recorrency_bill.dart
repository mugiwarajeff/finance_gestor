import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';

class RecorrencyBill extends Bill {
  int? limitRecorrency;

  RecorrencyBill(
      {required super.name,
      required super.description,
      required super.dueDate,
      required super.paid,
      required super.value,
      required super.category,
      required this.limitRecorrency});

  RecorrencyBill.fromJson(super.json) : super.fromJson();

  RecorrencyBill.empty() : super.empty();
}
