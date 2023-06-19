import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  final LoadedCardState _paidCardState = LoadedCardState(
      principalColor: Colors.green,
      secondaryColor: const Color.fromARGB(30, 105, 240, 175),
      billStates: BillStates.paid);

  final LoadedCardState _overdueCardState = LoadedCardState(
      principalColor: Colors.orange,
      secondaryColor: const Color.fromARGB(30, 255, 172, 64),
      billStates: BillStates.overdue);

  final LoadedCardState _openCardState = LoadedCardState(
      principalColor: Colors.blue,
      secondaryColor: const Color.fromARGB(30, 68, 137, 255),
      billStates: BillStates.open);

  LoadedCardState get paidCardState => _paidCardState;
  LoadedCardState get overdueCardState => _overdueCardState;
  LoadedCardState get openCardState => _openCardState;

  CardCubit(Bill bill) : super(InitialCardState()) {
    _getCardState(bill);
  }

  void _getCardState(Bill bill) {
    if (bill.paid) {
      emit(_paidCardState);
    } else {
      _verifyIfOverdue(bill);
    }
  }

  void _verifyIfOverdue(Bill bill) {
    if (DateTime.now().isAfter(bill.dueDate)) {
      emit(_overdueCardState);
    } else {
      emit(_openCardState);
    }
  }
}
