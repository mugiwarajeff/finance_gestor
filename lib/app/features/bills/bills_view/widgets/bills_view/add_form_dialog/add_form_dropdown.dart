import 'package:finance_gestor/app/shared/value_object/value_object.dart';
import 'package:flutter/material.dart';

class AddFormDropdown extends StatelessWidget {
  final ValueObject value;
  final List<String> validatedValues;
  final IconData icon;
  final String label;
  final String hint;
  final Function(dynamic)? onChange;
  const AddFormDropdown(
      {super.key,
      required this.value,
      required this.validatedValues,
      required this.label,
      required this.hint,
      required this.onChange,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: validatedValues
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      value: value.value,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
        icon: Icon(icon),
        labelText: label,
        alignLabelWithHint: true,
      ),
    );
  }
}
