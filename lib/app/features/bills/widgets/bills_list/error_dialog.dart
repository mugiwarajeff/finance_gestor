import 'package:finance_gestor/app/features/bills/cubits/bills_list/error_types.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final IconData errorIcon = Icons.error;
  final Color iconColor = Colors.red;
  final double iconSize = 64;
  final BillsErrorType billsErrorType;
  late final String errorTitle;
  late final String errorBody;

  ErrorDialog({super.key, required this.billsErrorType}) {
    switch (billsErrorType) {
      case BillsErrorType.insert:
        errorTitle = "Error ao inserir";
        errorBody =
            "O banco de dados identificou que já existe uma conta de mesmo nome cadastrada";
        break;
      case BillsErrorType.delete:
        errorTitle = "Error ao deletar";
        errorBody = "Não identificado";
        break;
      case BillsErrorType.obtain:
        errorTitle = "Error ao obter dados";
        errorBody = "Error Não identificado";
        break;
      case BillsErrorType.update:
        errorTitle = "Error ao atualizar dados";
        errorBody = "Error Não identificado";
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
