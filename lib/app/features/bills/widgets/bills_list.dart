import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/bill.dart';
import 'bill_card.dart';

class BillsList extends StatelessWidget {
  final List<Bill> bills;
  const BillsList({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => BillCard(bill: bills.elementAt(index)),
      itemCount: bills.length,
    );
  }
}
