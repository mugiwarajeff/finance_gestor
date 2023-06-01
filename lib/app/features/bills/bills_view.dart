import 'package:finance_gestor/app/features/bills/controllers/bills_controller.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list.dart';
import 'package:flutter/material.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BillsList(bills: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
