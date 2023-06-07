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
}
