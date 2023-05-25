import 'package:flutter/material.dart';

class AddFormInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextEditingController textEditingController;
  final int? quantLine;
  final void Function()? onTap;
  final bool? readOnly;
  final TextInputType? textInputType;

  const AddFormInput(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.textEditingController,
      this.quantLine,
      this.onTap,
      this.readOnly,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: quantLine,
      onTap: onTap,
      keyboardType: textInputType,
      readOnly: readOnly ?? false,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(icon),
        labelText: labelText,
        alignLabelWithHint: true,
      ),
    );
  }
}
