import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

abstract class CardState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCardState extends CardState {}

class LoadingCardState extends CardState {}

class ErrorCardState extends CardState {}

class PaidLoadedCardState extends CardState {
  final Color principalColor = Colors.green;
  final Color secondaryColor = const Color.fromARGB(30, 105, 240, 175);
  final BillStates billStates = BillStates.paid;

  @override
  List<Object> get props => [principalColor, secondaryColor, billStates];
}

class OverdueLoadedCardState extends CardState {
  final Color principalColor = Colors.orange;
  final Color secondaryColor = const Color.fromARGB(30, 255, 172, 64);
  final BillStates billStates = BillStates.overdue;

  @override
  List<Object> get props => [principalColor, secondaryColor, billStates];
}

class OpenLoadedCardState extends CardState {
  final Color principalColor = Colors.blue;
  final Color secondaryColor = const Color.fromARGB(30, 68, 137, 255);
  final BillStates billStates = BillStates.open;

  @override
  List<Object> get props => [principalColor, secondaryColor, billStates];
}
