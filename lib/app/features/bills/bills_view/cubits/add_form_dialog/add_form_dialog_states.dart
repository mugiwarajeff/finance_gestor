import 'package:equatable/equatable.dart';

abstract class AddFormDialogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAddFormDialogState extends AddFormDialogState {}

class LoadingAddFormDialogState extends AddFormDialogState {}

class LoadedAddFormDialogState extends AddFormDialogState {}

class SentState extends AddFormDialogState {}
