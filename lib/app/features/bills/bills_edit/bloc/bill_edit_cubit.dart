import 'package:finance_gestor/app/features/bills/bills_edit/bloc/bills_edit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bills_view/models/bill.dart';

class BillEditCubit extends Cubit<BillEditState> {
  final Bill bill;

  BillEditCubit({required this.bill}) : super(InitialBillEditState()) {
    emit(LoadedBillEditState(bill: bill));
  }
}
