class Bill {
  final String name;
  final double value;
  final String? description;
  final DateTime dueDate;
  final bool paid;

  Bill(
      {required this.name,
      required this.value,
      this.description,
      required this.dueDate,
      required this.paid});
}
