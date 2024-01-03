import 'package:finance_gestor/app/shared/value_object/value_object.dart';

class LimitRecorrency extends ValueObject<int> {
  LimitRecorrency({required super.value});

  @override
  String? validate(String? toValidate) {
    String? validateReturn;

    int? convertedNumber = int.tryParse(toValidate ?? "");

    if (convertedNumber == null) {
      validateReturn = "Value is not a number";
    }

    if (toValidate != null && toValidate.isEmpty) {
      validateReturn = "Value is Blank";
    }

    return validateReturn;
  }
}
