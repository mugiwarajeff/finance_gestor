import 'package:finance_gestor/app/features/bills/controllers/bills_controller.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final BillsController billsController =
        Provider.of<BillsController>(context);
    return Scaffold(
      body: BillsList(bills: billsController.bills),
      floatingActionButton: FloatingActionButton(
        onPressed: () => billsController.showAddBillDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
