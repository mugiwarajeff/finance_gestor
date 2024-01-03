import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/recorrency_bill.dart';

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

  IsolatedBill.fromRecorrencyBill(RecorrencyBill recorrencyBill)
      : super(
            category: recorrencyBill.category,
            description: recorrencyBill.description,
            dueDate: recorrencyBill.dueDate,
            name: recorrencyBill.name,
            paid: recorrencyBill.paid,
            value: recorrencyBill.value);
}
