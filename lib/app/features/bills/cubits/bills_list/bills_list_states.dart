import 'package:equatable/equatable.dart';

import '../../models/bill.dart';
import 'error_types.dart';

abstract class BillsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class BillsListInitial extends BillsListState {}

class BillsListLoading extends BillsListState {}

class BillsListLoaded extends BillsListState {
  final List<Bill> bills;

  BillsListLoaded({required this.bills});

  @override
  List<Object> get props => [bills];
}

class BillsListError extends BillsListState {
  final BillsErrorType errorType;

  BillsListError({required this.errorType});
}
