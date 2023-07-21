import 'package:finance_gestor/app/features/bills/models/form_unvalidated_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddFormInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextEditingController textEditingController;
  final int? quantLine;
  final void Function()? onTap;
  final bool? readOnly;
  final TextInputType? textInputType;
  final UnvalidatedTypes? unvalidatedType;

  const AddFormInput(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.textEditingController,
      this.quantLine,
      this.onTap,
      this.readOnly,
      this.textInputType,
      this.unvalidatedType});

  @override
  Widget build(BuildContext context) {
    String? selectUnvalidatedType() {
      switch (unvalidatedType) {
        case UnvalidatedTypes.nameBlank:
          return AppLocalizations.of(context)!.nameIsBlank;

        case UnvalidatedTypes.valueBlank:
          return AppLocalizations.of(context)!.valueIsBlank;

        case UnvalidatedTypes.valueNotNumeric:
          return AppLocalizations.of(context)!.valueIsNotNumber;

        case UnvalidatedTypes.dateBlank:
          return AppLocalizations.of(context)!.dateIsBlank;

        default:
          return null;
      }
    }

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
          errorText: selectUnvalidatedType()),
    );
  }
}
