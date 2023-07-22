import 'package:flutter/material.dart';

class InputEdit extends StatelessWidget {
  final TextEditingController controller;
  final IconData inputIcon;

  const InputEdit(
      {super.key, required this.inputIcon, required this.controller});
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 30;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(inputIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
