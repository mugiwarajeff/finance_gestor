import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/enuns/bill_type.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';

abstract class AddFormDialogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAddFormDialogState extends AddFormDialogState {}

class LoadingAddFormDialogState extends AddFormDialogState {}

class LoadedAddFormDialogState extends AddFormDialogState {
  final Set<BillType> billType;
  final Bill newBill;

  LoadedAddFormDialogState({required this.billType, required this.newBill});
}

class SentState extends AddFormDialogState {}
