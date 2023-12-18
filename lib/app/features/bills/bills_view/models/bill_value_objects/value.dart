import 'package:finance_gestor/app/shared/value_object/value_object.dart';

class Value extends ValueObject<double> {
  Value({required super.value});

  @override
  String? validate(String? toValidate) {
    String? validateReturn;

    double? convertedNumber = double.tryParse(toValidate ?? "");

    if (convertedNumber == null) {
      validateReturn = "Value is not a number";
    }

    if (toValidate != null && toValidate.isEmpty) {
      validateReturn = "Value is Blank";
    }

    return validateReturn;
  }
}
