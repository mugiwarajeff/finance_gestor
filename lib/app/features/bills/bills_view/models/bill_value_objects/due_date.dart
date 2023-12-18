import 'package:finance_gestor/app/shared/value_object/value_object.dart';

class DueDate extends ValueObject<DateTime> {
  DueDate({required super.value});

  @override
  String? validate(String? toValidate) {
    String? validateReturn;

    if (toValidate != null && toValidate.isEmpty) {
      return "Due Date is Blank!";
    }

    return validateReturn;
  }
}
