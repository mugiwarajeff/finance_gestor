import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bill_card.dart';

class BillsList extends StatelessWidget {
  final BillsListCubit billsListCubit;
  const BillsList({super.key, required this.billsListCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: billsListCubit,
      builder: (context, BillsListState state) {
        if (state is BillsListInitial) {
          return Container();
        } else if (state is BillsListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BillsListLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                BillCard(bill: state.bills.elementAt(index)),
            itemCount: state.bills.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
