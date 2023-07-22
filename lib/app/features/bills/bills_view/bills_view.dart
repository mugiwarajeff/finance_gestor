import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/bills_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/bills_list/bills_list_bloc.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    BillsListCubit billsListCubit = BlocProvider.of<BillsListCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BillsList(billsListCubit: billsListCubit),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            billsListCubit.showAddBillDialog(context, billsListCubit),
        child: const Icon(Icons.add),
      ),
    );
  }
}
