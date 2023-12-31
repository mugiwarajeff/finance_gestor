import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/input_type.dart';
import 'package:finance_gestor/app/shared/value_object/value_object.dart';
import 'package:flutter/material.dart';

class AddFormInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final double? width;
  final IconData? icon;
  final int? quantLine;
  final void Function(dynamic)? onChange;
  final bool? readOnly;

  final ValueObject value;
  final InputType inputType;
  late final TextEditingController textEditingController;

  AddFormInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.value,
    required this.inputType,
    required this.textInputType,
    this.icon,
    this.width,
    this.onChange,
    this.quantLine,
    this.readOnly,
  }) {
    textEditingController = TextEditingController(text: value.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: textEditingController,
        maxLines: quantLine,
        onTap: () => {
          if (inputType == InputType.date)
            {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2050),
                builder: (context, child) => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 500,
                        child: child,
                      ),
                    ],
                  ),
                ),
              ).then((dateTime) {
                if (dateTime != null) {
                  textEditingController.text =
                      dateTime.toIso8601String().substring(0, 19);
                  value.value = dateTime;
                }
              })
            }
        },
        keyboardType: textInputType,
        readOnly: readOnly ?? false,
        validator: (v) => value.validate(v),
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon),
          labelText: labelText,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
