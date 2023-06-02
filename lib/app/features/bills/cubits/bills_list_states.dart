import '../models/bill.dart';

abstract class BillsListState {
  List<Bill> bills;

  BillsListState({required this.bills});
}

class BillsListInitial extends BillsListState {
  BillsListInitial({required super.bills});
}

class BillsListLoading extends BillsListState {
  BillsListLoading({required super.bills});
}

class BillsListLoaded extends BillsListState {
  BillsListLoaded({required super.bills});
}

class BillsListError extends BillsListState {
  BillsListError({required super.bills});
}
