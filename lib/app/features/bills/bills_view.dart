import 'package:finance_gestor/app/features/bills/controllers/bills_controller.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    BillsListCubit billsListCubit = BlocProvider.of<BillsListCubit>(context);
    BillsController billsController = BillsController();

    billsListCubit.changeToLoaded();
    return Scaffold(
      body: BlocBuilder(
          bloc: billsListCubit,
          builder: (context, state) {
            if (state is BillsListInitial) {
              return const BillsList(bills: []);
            } else if (state is BillsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BillsListLoaded) {
              return BillsList(bills: state.bills);
            } else {
              return Container();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => billsController.showAddBillDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
