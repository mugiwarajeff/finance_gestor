import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final String titleText = AppLocalizations.of(context)!.areYouSure;
    const IconData icon = Icons.warning;
    const double iconSize = 64;
    Color iconColor = Theme.of(context).colorScheme.onPrimaryContainer;
    final String contentText = AppLocalizations.of(context)!.areYouSureText;
    final String deleteText = AppLocalizations.of(context)!.delete;
    final String cancelText = AppLocalizations.of(context)!.cancel;
    return AlertDialog(
      title: Text(titleText),
      icon: const Icon(
        icon,
        size: iconSize,
      ),
      iconColor: iconColor,
      content: Text(contentText),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(deleteText)),
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText)),
      ],
    );
  }
}
