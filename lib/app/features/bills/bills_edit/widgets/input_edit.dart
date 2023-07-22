import 'package:flutter/material.dart';

class InputEdit extends StatelessWidget {
  final TextEditingController controller;
  final IconData inputIcon;
  final int? minLines;
  final bool? readOnly;

  const InputEdit(
      {super.key,
      required this.inputIcon,
      required this.controller,
      this.readOnly,
      this.minLines});
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 30;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        maxLines: minLines,
        decoration: InputDecoration(
          icon: Icon(inputIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
