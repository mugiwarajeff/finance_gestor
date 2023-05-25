import 'package:finance_gestor/app/features/bills/controllers/card_trailing_controller.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

class CardTrailin extends StatelessWidget {
  final double cardHeight = 40;
  final double cardWidth = 70;
  final double cardRadius = 25;
  final CardTrailinController cardTrailinController = CardTrailinController();
  final BillStates billState;

  CardTrailin({super.key, required this.billState});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          color: cardTrailinController.getSecondaryColor(billState),
          border: Border.all(
              width: 1,
              color: cardTrailinController.getPrincipalColor(billState))),
      alignment: Alignment.center,
      child: Text(
          "${billState.name.split("").first.toUpperCase()}${billState.name.substring(1)}",
          style: TextStyle(
              color: cardTrailinController.getPrincipalColor(billState))),
    );
  }
}
