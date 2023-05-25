import 'package:finance_gestor/app/features/bills/controllers/bill_card_controller.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';

import 'package:finance_gestor/app/features/bills/widgets/bill_card/card_trailing.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final BillCardController billCardController = BillCardController();
  final double iconSize = 30;
  final Bill bill;

  BillCard({super.key, required this.bill});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Align(
        alignment: Alignment.center,
        child: ListTile(
          title:
              Text("R\$ ${bill.value.toStringAsFixed(2).replaceAll(".", ",")}"),
          subtitle: Text(bill.name),
          leading: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.monetization_on,
              size: iconSize,
            ),
          ),
          trailing:
              CardTrailin(billState: billCardController.getCardState(bill)),
        ),
      ),
    );
  }
}
