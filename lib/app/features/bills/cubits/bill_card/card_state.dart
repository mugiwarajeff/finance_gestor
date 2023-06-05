import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

abstract class CardState {}

class InitialCardState extends CardState {}

class LoadingCardState extends CardState {}

class ErrorCardState extends CardState {}

class LoadedCardState extends CardState {
  final Color principalColor;
  final Color secondaryColor;
  final BillStates billStates;

  LoadedCardState(
      {required this.principalColor,
      required this.secondaryColor,
      required this.billStates});
}
