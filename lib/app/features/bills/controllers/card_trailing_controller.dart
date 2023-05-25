import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

class CardTrailinController {
  final Color _principalOpenColor = Colors.blue;
  final Color _principalOverdueColor = Colors.orange;
  final Color _principalPaidColor = Colors.green;

  final Color _secondaryOpenColor = const Color.fromARGB(30, 68, 137, 255);
  final Color _secondaryOverdueColor = const Color.fromARGB(30, 255, 172, 64);
  final Color _secondaryPaidColor = const Color.fromARGB(30, 105, 240, 175);

  Color getPrincipalColor(BillStates state) {
    switch (state) {
      case BillStates.open:
        return _principalOpenColor;
      case BillStates.overdue:
        return _principalOverdueColor;
      case BillStates.paid:
        return _principalPaidColor;
    }
  }

  Color getSecondaryColor(BillStates state) {
    switch (state) {
      case BillStates.open:
        return _secondaryOpenColor;
      case BillStates.overdue:
        return _secondaryOverdueColor;
      case BillStates.paid:
        return _secondaryPaidColor;
    }
  }
}
