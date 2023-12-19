import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

import '../../models/enuns/bill_state.dart';

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
