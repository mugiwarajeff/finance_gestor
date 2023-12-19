import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../models/enuns/bill_state.dart';

class CardTrailin extends StatelessWidget {
  final double cardHeight = 40;
  final double cardWidth = 70;
  final double cardRadius = 25;
  final Color principalColor;
  final Color secondaryColor;
  final BillStates billStates;

  const CardTrailin(
      {super.key,
      required this.principalColor,
      required this.secondaryColor,
      required this.billStates});

  String getText(BuildContext context) {
    switch (billStates) {
      case BillStates.open:
        return AppLocalizations.of(context)!.open;
      case BillStates.overdue:
        return AppLocalizations.of(context)!.overdue;
      case BillStates.paid:
        return AppLocalizations.of(context)!.paid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          color: secondaryColor,
          border: Border.all(
            width: 1,
            color: principalColor,
          )),
      alignment: Alignment.center,
      child: Text(getText(context), style: TextStyle(color: principalColor)),
    );
  }
}
