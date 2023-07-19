import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    const String titleText = "Are you sure?";
    const IconData icon = Icons.warning;
    const double iconSize = 64;
    Color iconColor = Theme.of(context).primaryColor;
    const String contentText =
        "Do you really want to delete these bill? this process cannot be undone.";
    const String deleteText = "Delete";
    const String cancelText = "Cancel";
    return AlertDialog(
      title: const Text(titleText),
      icon: const Icon(
        icon,
        size: iconSize,
      ),
      iconColor: iconColor,
      content: const Text(contentText),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(deleteText)),
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(cancelText)),
      ],
    );
  }
}
