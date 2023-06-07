import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  final Color _principalColorPaid = Colors.green;
  final Color _secondaryColorPaid = const Color.fromARGB(30, 105, 240, 175);
  final Color _principalColorOverdue = Colors.orange;
  final Color _secondaryColorOverdue = const Color.fromARGB(30, 255, 172, 64);
  final Color _principalColorOpen = Colors.blue;
  final Color _secondaryColorOpen = const Color.fromARGB(30, 68, 137, 255);

  CardCubit(Bill bill) : super(InitialCardState()) {
    _getCardState(bill);
  }

  void _getCardState(Bill bill) {
    if (bill.paid) {
      emit(LoadedCardState(
          principalColor: _principalColorPaid,
          secondaryColor: _secondaryColorPaid,
          billStates: BillStates.paid));
    } else {
      _verifyIfOverdue(bill);
    }
  }

  void _verifyIfOverdue(Bill bill) {
    if (DateTime.now().isAfter(bill.dueDate)) {
      emit(LoadedCardState(
        principalColor: _principalColorOverdue,
        secondaryColor: _secondaryColorOverdue,
        billStates: BillStates.overdue,
      ));
    } else {
      emit(LoadedCardState(
        principalColor: _principalColorOpen,
        secondaryColor: _secondaryColorOpen,
        billStates: BillStates.open,
      ));
    }
  }
}
