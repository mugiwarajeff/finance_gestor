import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BillsEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String billsEditText = AppLocalizations.of(context)!.billsEdit;
    return Scaffold(
      appBar: AppBar(title: Text(billsEditText)),
    );
  }
}
