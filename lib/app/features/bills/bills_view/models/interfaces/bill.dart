import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/bill_category.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';
import '../bill_value_objects/name.dart';
import '../bill_value_objects/value.dart';

abstract class Bill extends Equatable {
  final Name name;
  final Value value;
  final Description description;
  final DueDate dueDate;
  final bool paid;
  final BillCategory category;

  const Bill(
      {required this.name,
      required this.value,
      required this.description,
      required this.dueDate,
      required this.paid,
      required this.category});

  @override
  List<Object?> get props => [name.value, value.value, description.value, paid];

  Bill.empty()
      : name = Name(value: ""),
        description = Description(value: ""),
        paid = false,
        dueDate = DueDate(value: DateTime.now()),
        category = BillCategory(value: ""),
        value = Value(value: 0);

  Bill.fromJson(Map<String, dynamic> json)
      : name = Name(value: json["name"]),
        value = Value(value: json["value"]),
        description = Description(value: json["description"]),
        dueDate = DueDate(
            value: DateTime.fromMillisecondsSinceEpoch(json["dueDate"])),
        category = BillCategory(value: json["category"]),
        paid = json["paid"] == 1 ? true : false;

  Map<String, dynamic> toJsonDB() => {
        "name": name.value,
        "value": value.value,
        "description": description.value,
        "dueDate": dueDate.value.millisecondsSinceEpoch,
        "category": category.value,
        "paid": paid ? 1 : 0
      };
}
