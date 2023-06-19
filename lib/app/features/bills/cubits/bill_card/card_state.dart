import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';
import 'package:flutter/material.dart';

abstract class CardState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCardState extends CardState {}

class LoadedCardState extends CardState {
  final Color principalColor;
  final Color secondaryColor;
  final BillStates billStates;

  LoadedCardState(
      {required this.principalColor,
      required this.secondaryColor,
      required this.billStates});

  @override
  List<Object> get props => [principalColor, secondaryColor, billStates];
}
