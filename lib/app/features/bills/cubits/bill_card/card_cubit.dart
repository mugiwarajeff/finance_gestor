import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(Bill bill) : super(InitialCardState()) {
    _getCardState(bill);
  }

  void _getCardState(Bill bill) {
    if (bill.paid) {
      emit(PaidLoadedCardState());
    } else {
      _verifyIfOverdue(bill);
    }
  }

  void _verifyIfOverdue(Bill bill) {
    if (DateTime.now().isAfter(bill.dueDate)) {
      emit(OverdueLoadedCardState());
    } else {
      emit(OpenLoadedCardState());
    }
  }
}
