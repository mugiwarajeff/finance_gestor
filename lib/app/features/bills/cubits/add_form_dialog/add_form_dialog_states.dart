abstract class AddFormDialogState {}

class InitialAddFormDialogState extends AddFormDialogState {}

class LoadedAddFormDialogState extends AddFormDialogState {}

class UnvalidatedAddFormDialogState extends AddFormDialogState {
  String? nameError;
  String? valueError;
  String? dateError;

  UnvalidatedAddFormDialogState(
      {this.dateError, this.nameError, this.valueError});
}

class SentState extends AddFormDialogState {}
