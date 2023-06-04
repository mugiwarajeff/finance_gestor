import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

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
      child: Text(
          "${billStates.name.split("").first.toUpperCase()}${billStates.name.substring(1)}",
          style: TextStyle(color: principalColor)),
    );
  }
}
