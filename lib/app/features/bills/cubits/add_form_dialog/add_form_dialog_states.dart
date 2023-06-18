import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/models/bill_state.dart';

abstract class AddFormDialogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAddFormDialogState extends AddFormDialogState {}

class LoadingAddFormDialogState extends AddFormDialogState {}

class LoadedAddFormDialogState extends AddFormDialogState {}

class UnvalidatedAddFormDialogState extends AddFormDialogState {
  final String? nameError;
  final String? valueError;
  final String? dateError;

  UnvalidatedAddFormDialogState(
      {this.dateError, this.nameError, this.valueError});

  @override
  List<Object?> get props => [nameError, valueError, dateError];
}

class SentState extends AddFormDialogState {}
