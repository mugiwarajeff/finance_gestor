import '../../models/bill.dart';

abstract class BillsListState {}

class BillsListInitial extends BillsListState {}

class BillsListLoading extends BillsListState {}

class BillsListLoaded extends BillsListState {
  List<Bill> bills;

  BillsListLoaded({required this.bills});
}

class BillsListError extends BillsListState {}
