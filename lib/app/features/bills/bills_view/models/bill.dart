import 'package:equatable/equatable.dart';

class Bill extends Equatable {
  final String name;
  final double value;
  final String? description;
  final DateTime dueDate;
  final bool paid;

  const Bill(
      {required this.name,
      required this.value,
      this.description,
      required this.dueDate,
      required this.paid});

  @override
  List<Object?> get props => [name, value, description, dueDate, paid];

  Bill.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        value = json["value"],
        description = json["description"],
        dueDate = DateTime.fromMillisecondsSinceEpoch(json["dueDate"]),
        paid = json["paid"] == 1 ? true : false;

  Map<String, dynamic> toJsonDB() => {
        "name": name,
        "value": value,
        "description": description,
        "dueDate": dueDate.millisecondsSinceEpoch,
        "paid": paid ? 1 : 0
      };
}
