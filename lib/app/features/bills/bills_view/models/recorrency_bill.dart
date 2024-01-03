import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/limite_recorrency.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';

class RecorrencyBill extends Bill {
  final LimitRecorrency limitRecorrency;

  const RecorrencyBill(
      {required super.name,
      required super.description,
      required super.dueDate,
      required super.paid,
      required super.value,
      required super.category,
      required this.limitRecorrency});

  RecorrencyBill.fromJson(json)
      : limitRecorrency = json["limit_recorrency"],
        super.fromJson(json);

  RecorrencyBill.empty()
      : limitRecorrency = LimitRecorrency(value: 0),
        super.empty();
}
