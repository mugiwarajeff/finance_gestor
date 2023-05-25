import 'package:finance_gestor/app/features/bills/models/bill_state.dart';

import '../models/bill.dart';

class BillCardController {
  BillStates getCardState(Bill bill) {
    if (bill.paid) {
      return BillStates.paid;
    }

    return _verifyIfOverdue(bill);
  }

  BillStates _verifyIfOverdue(Bill bill) {
    if (DateTime.now().isAfter(bill.dueDate)) {
      return BillStates.overdue;
    }

    return BillStates.open;
  }
}
