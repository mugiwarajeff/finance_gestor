import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';

class IsolatedBill extends Bill {
  const IsolatedBill(
      {required super.name,
      required super.value,
      required super.description,
      required super.dueDate,
      required super.paid,
      required super.category});

  IsolatedBill.empty() : super.empty();

  IsolatedBill.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
