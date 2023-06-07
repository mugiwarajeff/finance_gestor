import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    BillsListCubit billsListCubit = BlocProvider.of<BillsListCubit>(context);

    return Scaffold(
      body: BlocBuilder(
          bloc: billsListCubit,
          builder: (context, BillsListState state) {
            if (state is BillsListInitial) {
              return Container();
            } else if (state is BillsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BillsListLoaded) {
              return BillsList(bills: state.bills);
            } else {
              return Container();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => billsListCubit.showAddBillDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
