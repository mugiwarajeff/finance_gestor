import 'package:equatable/equatable.dart';

import '../../models/form_unvalidated_state.dart';

abstract class AddFormDialogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAddFormDialogState extends AddFormDialogState {}

class LoadingAddFormDialogState extends AddFormDialogState {}

class LoadedAddFormDialogState extends AddFormDialogState {}

class UnvalidatedAddFormDialogState extends AddFormDialogState {
  final List<UnvalidatedTypes> unvalidatedTypes;

  UnvalidatedAddFormDialogState({required this.unvalidatedTypes});

  @override
  List<Object?> get props => [...unvalidatedTypes];
}

class SentState extends AddFormDialogState {}
