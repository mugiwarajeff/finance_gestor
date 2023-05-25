import 'package:flutter/material.dart';

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
