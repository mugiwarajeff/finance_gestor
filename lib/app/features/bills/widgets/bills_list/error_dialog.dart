import 'package:finance_gestor/app/features/bills/cubits/bills_list/error_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorDialog extends StatelessWidget {
  final IconData errorIcon = Icons.error;
  final Color iconColor = Colors.red;
  final double iconSize = 64;
  final BillsErrorType billsErrorType;
  final BuildContext context;
  late final String errorTitle;
  late final String errorBody;

  ErrorDialog(
      {super.key, required this.billsErrorType, required this.context}) {
    switch (billsErrorType) {
      case BillsErrorType.insert:
        errorTitle = AppLocalizations.of(context)!.errorToInsert;
        errorBody = AppLocalizations.of(context)!.databaseIdentifyErrorToInsert;
        break;
      case BillsErrorType.delete:
        errorTitle = AppLocalizations.of(context)!.errorToDelete;
        errorBody = AppLocalizations.of(context)!.unknownError;
        break;
      case BillsErrorType.obtain:
        errorTitle = AppLocalizations.of(context)!.erroToObtain;
        errorBody = AppLocalizations.of(context)!.unknownError;
        break;
      case BillsErrorType.update:
        errorTitle = AppLocalizations.of(context)!.errorToUpdate;
        errorBody = AppLocalizations.of(context)!.unknownError;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        errorIcon,
        color: iconColor,
        size: iconSize,
      ),
      title: Text(errorTitle),
      content: Text(errorBody),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"))
      ],
    );
  }
}
