import 'package:finance_gestor/app/features/bills/cubits/card_trailing/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  final Color principalColorPaid = Colors.green;
  final Color secondaryColorPaid = const Color.fromARGB(30, 105, 240, 175);
  final Color principalColorOverdue = Colors.orange;
  final Color secondaryColorOverdue = const Color.fromARGB(30, 255, 172, 64);
  final Color principalColorOpen = Colors.blue;
  final Color secondaryColorOpen = const Color.fromARGB(30, 68, 137, 255);

  CardCubit(Bill bill) : super(InitialCardState()) {
    _getCardState(bill);
  }

  void _getCardState(Bill bill) async {
    emit(LoadingCardState());
    if (bill.paid) {
      emit(LoadedCardState(
          principalColor: principalColorPaid,
          secondaryColor: secondaryColorPaid,
          billStates: BillStates.paid));
    } else {
      _verifyIfOverdue(bill);
    }
  }

  void _verifyIfOverdue(Bill bill) {
    if (DateTime.now().isAfter(bill.dueDate)) {
      emit(LoadedCardState(
        principalColor: principalColorOverdue,
        secondaryColor: secondaryColorOverdue,
        billStates: BillStates.overdue,
      ));
    } else {
      emit(LoadedCardState(
        principalColor: principalColorOpen,
        secondaryColor: secondaryColorOpen,
        billStates: BillStates.open,
      ));
    }
  }
}
