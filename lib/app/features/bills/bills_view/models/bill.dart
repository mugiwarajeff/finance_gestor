import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/description.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill_value_objects/due_date.dart';

import 'bill_value_objects/name.dart';
import 'bill_value_objects/value.dart';

class Bill extends Equatable {
  final Name name;
  final Value value;
  final Description description;
  final DueDate dueDate;
  final bool paid;

  const Bill(
      {required this.name,
      required this.value,
      required this.description,
      required this.dueDate,
      required this.paid});

  @override
  List<Object?> get props => [name.value, value.value, description.value, paid];

  Bill.empty()
      : name = Name(value: ""),
        description = Description(value: ""),
        paid = false,
        dueDate = DueDate(value: DateTime.now()),
        value = Value(value: 0);

  Bill.fromJson(Map<String, dynamic> json)
      : name = Name(value: json["name"]),
        value = Value(value: json["value"]),
        description = Description(value: json["description"]),
        dueDate = DueDate(
            value: DateTime.fromMillisecondsSinceEpoch(json["dueDate"])),
        paid = json["paid"] == 1 ? true : false;

  Map<String, dynamic> toJsonDB() => {
        "name": name.value,
        "value": value.value,
        "description": description.value,
        "dueDate": dueDate.value.millisecondsSinceEpoch,
        "paid": paid ? 1 : 0
      };
}
