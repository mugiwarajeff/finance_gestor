import 'package:finance_gestor/app/shared/value_object/value_object.dart';

class Name extends ValueObject<String> {
  Name({required super.value});

  @override
  String? validate(String? toValidate) {
    String? validateReturn;

    if (toValidate != null && toValidate.isEmpty) {
      validateReturn = "Name is Blank";
    }

    return validateReturn;
  }
}
