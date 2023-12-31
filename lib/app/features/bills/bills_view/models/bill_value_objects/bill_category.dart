import 'package:finance_gestor/app/shared/value_object/value_object.dart';

class BillCategory extends ValueObject<String> {
  static final List<BillCategory> availableCategories = [
    BillCategory(value: "Crédito"),
    BillCategory(value: "Manutenção Casa")
  ];

  BillCategory({required super.value});

  @override
  String? validate(String? toValidate) {
    String? validateResult;

    if (value.isNotEmpty) {
      validateResult = "Required Field";
    }

    return validateResult;
  }
}
